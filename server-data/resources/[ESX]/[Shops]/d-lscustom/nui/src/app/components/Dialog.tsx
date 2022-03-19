import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import icon from '../../images/dollah.png'

const Container = styled.div`
    position: fixed;
    transform: translate(-50%, -50%);
    top: 50%;
    left: 50%;
    width: 100%;
    padding: 5vh;
    background: rgba(0,0,0,0.8);
    z-index: 10;
    transition: .25s;
`;

const Label = styled.div`
    font-family: Heat;
    font-size: 5.5vh;
    color: white;
    text-align: center;
`;

const Header = styled.div`
    font-family: HeatMain;
    margin: 1.5vh;
    font-size: 3vh;
    color: grey;
    text-align: center;
`

const Price = styled.div`
    font-family: HeatMain;
    margin: 1.5vh;
    font-size: 3vh;
    color: yellow;
    text-align: center;
`

const Option = styled.div`
    font-family: HeatMain;
    font-size: 2.25vh;
    color: white;
    width: 100%;
    padding-top: .75vh;
    padding-bottom: .75vh;
    text-align: center;
`;

const options = ['yes', 'no'];

const Dialog = () => {
    const { activeDialog, activeOption, label, header, price} = useSelector((state: any) => state.Dialog);

    useEffect(() => {
        document.addEventListener("keydown", keyPress, false);
        return () => document.removeEventListener("keydown", keyPress, false);
    }, []);

    const keyPress: void = (event) => {
        event.preventDefault();
        if(store.getState().Dialog.loading) return
        if(!store.getState().Dialog.activeDialog) return
        if(event.key == "ArrowUp"){
            store.dispatch({ type: "DIALOG_MOVE_UP" })
        } else if(event.key == "ArrowDown"){
            store.dispatch({ type: "DIALOG_MOVE_DOWN" })
        } else if(event.key == "Backspace"){
            setTimeout(() => store.dispatch({ type: "DIALOG_HIDE" }), 150)
        } else if(event.key == "Enter"){
            const state = store.getState()
            setTimeout(async () => {
                store.dispatch({ type: "DIALOG_HIDE" })
                if(options[state.Dialog.activeOption] == 'yes'){
                    var currentState = store.getState()
                    var currentMenuData = currentState.Menu.menus[currentState.Menu.activeMenu].list[currentState.Menu.menus[currentState.Menu.activeMenu].activeElement]
                    if(state.Dialog.action == "installMod"){
                        store.dispatch({ type: "SET_LOADING_STATE", state: true })
                        const response = await Nui.post(store.getState().Dialog.action, { modId: store.getState().Dialog.modId, id: store.getState().Dialog.id })
                        if(response == 'success'){
                            store.dispatch({type: "SET_INSTALLED_MOD"})
                        }
                        store.dispatch({ type: "SET_LOADING_STATE", state: false })
                    } else {
                        Nui.post(store.getState().Dialog.action, { modId: store.getState().Dialog.modId, id: store.getState().Dialog.id })
                    }
                }
            }, 150)
        }
    }

    const priceIcon = {
        width: '2vh',
    }

    const activeOptionStyle = {
        color: 'black',
        background: 'white',
        transition: 'background .1s, color .1s',
    }

    const dialogTransition = {
        display: 'block',
        transition: 'background .1s, color .1s',
    }

    return (
        <Container style={{ transform: (activeDialog == true ? 'translate(-50%, -50%) scaleY(1.0)' : 'translate(-50%, -50%) scaleY(0.0)') }}>
            {label && <Label>{label.toUpperCase()}</Label>}
            {header && <Header>{header.toUpperCase()}</Header>}
            {price != null && <Price><img src={icon} style={priceIcon} /> {price.toLocaleString('en', {useGrouping:true})}</Price>}
            {options.map((x, index) => <Option style={index == activeOption ? activeOptionStyle : {}}>{x.toUpperCase()}</Option>)}
        </Container>
    )
}

export default Dialog