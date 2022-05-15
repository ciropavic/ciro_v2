import React, { useState, useEffect, useRef } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../Nui";
import { store } from "../index";
import { menus, colorsList } from "./config"
import Nav from "./components/Nav";
import VerticalList from './components/VerticalList';

const Container = styled.div`
    position: absolute;
    width: 100%;
    height: 100%;
`;

const PalleteContainer = styled.div`
    position: absolute;
    top: 12%;
    left: 5%;
    width: 30vh;
    height: 57vh;
    overflow: hidden;
`

const PalleteHeader = styled.p`
    margin-top: 1.75vh;
    margin-left: 1.75vh;
    margin-bottom: 0;
    font-family: Heat;
    font-size: x-large;
    color: white;
`

const ColorsContainer = styled.div`
    position: relative;
    margin-top: 6.5vh;
    margin-left: 1.75vh;
    display: flex;
    flex-wrap: wrap;
    width: 42.5vh;
    /*background: rgba(255,255,255,0.1);*/
`


const mockData = [
        { index: 0, name: 'black'},
    { index: 1, name: 'graphite'},
    { index: 2, name: 'black_metallic'},
    { index: 3, name: 'caststeel'},
    { index: 11, name: 'black_anth'},
    { index: 12, name: 'matteblack'},
    { index: 15, name: 'darknight'},
    { index: 16, name: 'deepblack'},
    { index: 21, name: 'oil'},
    { index: 147, name: 'carbon'},
    { index: 106, name: 'vanilla'},
    { index: 107, name: 'creme'},
    { index: 111, name: 'white'},
    { index: 112, name: 'polarwhite'},
    { index: 113, name: 'beige'},
    { index: 121, name: 'mattewhite'},
    { index: 122, name: 'snow'},
    { index: 131, name: 'cotton'},
    { index: 132, name: 'alabaster'},
    { index: 134, name: 'purewhite'},
    { index: 4, name: 'silver'},
    { index: 5, name: 'metallicgrey'},
    { index: 6, name: 'laminatedsteel'},
    { index: 7, name: 'darkgray'},
    { index: 8, name: 'rockygray'},
    { index: 9, name: 'graynight'},
    { index: 10, name: 'aluminum'},
    { index: 13, name: 'graymat'},
    { index: 14, name: 'lightgrey'},
    { index: 17, name: 'asphaltgray'},
    { index: 18, name: 'grayconcrete'},
    { index: 19, name: 'darksilver'},
    { index: 20, name: 'magnesite'},
];

const paintTypes = [
    {
        id: 'primary_color',
        label: 'primary'
    },
    {
        id: 'secondary_color',
        label: 'secondary'
    },
    {
        id: 'pearlescent_color',
        label: 'pearlescent'
    },
    {
        id: 'wheels_color',
        label: 'wheels'
    }
];

const Paint = () => {
    const currentMenu: string = useSelector((state: any) => state.Menu.activeMenu)
    const currentColor: number = useSelector((state: any) => state.Paint.activeElement)
    const [paintEl, setPaintEl] = useState(<></>);

    const type = useRef(0)
    const throttle = useRef(false)
    const [updateState, setForceUpdate] = useState(Date.now());


    const currentColorStyle = {
        marginTop: '1.2vh',
        marginLeft: '1.9vh',
        width: '12vh',
        height: '3.2vh',
        background: 'rgb(177,177,177)'
    }

    useEffect(() => {}, [updateState])

    useEffect(() => {
        document.addEventListener("keydown", keyPress, false);

        window.addEventListener('message', (e: MessageEvent) => {
            if (e.data.type != "UPDATE_MENUS") return;
            type.current = 0;
            setForceUpdate(Date.now());
            store.dispatch({ type: "PAINT_RESET" })
        });

        return () => document.removeEventListener("keydown", keyPress, false);
    }, []);

    const keyPress: void = (event) => {
        event.preventDefault();
        if(store.getState().Dialog.loading) return
        if(store.getState().Menu.activeMenu != "paint") return
        if(store.getState().Dialog.activeDialog) return
        if(throttle.current == true) return

        throttle.current = true
        setTimeout(() => throttle.current = false, 30)

        const state = store.getState();
        const currentType = paintTypes[type.current].id

        if(event.key == "ArrowDown"){
            store.dispatch({ type: "PAINT_MOVE_DOWN", paintType: currentType })
            Nui.post("applyMod", { modId: currentType, id: state.Paint[currentType].list[state.Paint[currentType].activeElement].index })
        } else if(event.key == "ArrowUp"){
            store.dispatch({ type: "PAINT_MOVE_UP", paintType: currentType })
            Nui.post("applyMod", { modId: currentType, id: state.Paint[currentType].list[state.Paint[currentType].activeElement].index })
        } else if(event.key == "Enter"){
            store.dispatch({
                type: "DIALOG_SHOW", 
                action: "installMod", 
                label: "BUY AND INSTALL", 
                header: "COST:", 
                price: state.Paint[currentType].price,
                modId: currentType, 
                id: state.Paint[currentType].list[state.Paint[currentType].activeElement].index
            })
        }
    }

    const navLeft = () => {
        if(store.getState().Menu.activeMenu != "paint") return;
        type.current = type.current - 1 < 0 ? paintTypes.length - 1 : type.current - 1
        setForceUpdate(Date.now());
        const state = store.getState();
        const currentType = paintTypes[type.current].id
        Nui.post("applyMod", { modId: currentType, id: state.Paint[currentType].list[state.Paint[currentType].activeElement].index })
    }

    const navRight = () => {
        if(store.getState().Menu.activeMenu != "paint") return;
        type.current = type.current + 1 >= paintTypes.length  ? 0 : type.current + 1
        setForceUpdate(Date.now());
        const state = store.getState();
        const currentType = paintTypes[type.current].id
        Nui.post("applyMod", { modId: currentType, id: state.Paint[currentType].list[state.Paint[currentType].activeElement].index })
    }

    return (
        <Container hidden={currentMenu != "paint"}>
            <Nav data={{ navLeft: navLeft, navRight: navRight, activeElement: type, elements: paintTypes }}/>
            <PalleteContainer>
                {paintTypes.map((x, index) => <VerticalList key={index} data={{ activeTab: type.current == index, tabName: x.id }} />)}
            </PalleteContainer>
        </Container>
    )
}

/*
<ColorsContainer>
    { colorsList.map((x, index) => <div style={{ 'background': `rgb(${x.r}, ${x.g}, ${x.b})`, width: '2.1vh', height: '2.1vh', boxShadow: (index == currentColor ? "0px 0px 0px 3px white inset" : "") }}></div>) }
</ColorsContainer>
*/

export default Paint