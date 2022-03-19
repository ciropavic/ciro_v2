import React, { useEffect, useRef } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../Nui";
import { store } from "../index";

import bg from "../images/upgrades_9.png"
import MainMenu from './MainMenu'
import Customize from './Customize'
import Performance from './Performance'
import Body from './Body'
import MiscMenus from './MiscMenus'
import Paint from './Paint'
import Dialog from './components/Dialog'
import Loading from './components/Loading'
import Cash from './components/Cash'
import Legend from './components/Legend'
import Stance from './Stance'
import { colorsList } from './config'

Nui.onEvent("SHOW", (payload: boolean) => {
    store.dispatch({type: "SHOW", payload})
})

Nui.onEvent("EMPTY_LISTS", (payload: any) => {
    store.dispatch({type: "EMPTY_LISTS", payload})
})

Nui.onEvent("UPDATE_MENUS", (payload: any) => { 
    const success = store.dispatch({type: "OVERRIDE_MENU_OBJECT", payload: payload })
    store.dispatch({ type: "SET_LOADING_STATE", state: false })
})

Nui.onEvent("UPDATE_STANCE", (payload: any) => {
    store.dispatch({ type: "SLIDER_UPDATE", payload: payload })
})

Nui.onEvent("START_LOADING", (payload: any) => {
    store.dispatch({ type: "SET_LOADING_STATE", state: true })
})

const Container = styled.div`
    position: absolute;
    width: 100%;
    height: 100%;
    ${process.env.NODE_ENV == "development" && 
        css`
            background-image: url("${bg}");
        `
    }
`;

const App = () => {
    const throttle = useRef(false)
    const show: boolean = useSelector((state: any) => state.Show)
    const activeDialog: boolean = useSelector((state: any) => state.Dialog).activeDialog

    useEffect(() => {
        document.addEventListener("keydown", keyPress, false);
        if(process.env.NODE_ENV === 'development') initMenus();

        return () => {
          document.removeEventListener("keydown", keyPress, false);
        };
    }, []);

    const keyPress: void = (event) => {
        event.preventDefault();
        if(store.getState().Dialog.loading) return
        if(store.getState().Dialog.activeDialog) return
        if(throttle.current == true) return

        throttle.current = true
        setTimeout(() => throttle.current = false, 20)
        // console.log(event.key);
        var currentMenu = store.getState().Menu.activeMenu
        if(event.key == "ArrowRight"){
            store.dispatch({ type: "MOVE_RIGHT" })
            applyCurrentModPreview()
        } else if(event.key == "ArrowLeft"){
            store.dispatch({ type: "MOVE_LEFT" })
            applyCurrentModPreview()
        } else if(event.key == "Enter"){
            var currentState = store.getState()
            if(currentMenu != "paint"){
                var currentMenuData = currentState.Menu.menus[currentState.Menu.activeMenu].list[currentState.Menu.menus[currentState.Menu.activeMenu].activeElement]
                if(currentMenuData.childMenu == "paint" || (currentMenuData.childMenu != undefined && currentState.Menu.menus[currentMenuData.childMenu].list.length > 0)){
                    Nui.post("enteredMenu", { menuName: currentMenuData.childMenu })
                    store.dispatch({type: "SET_ACTIVE_MENU", payload: { menu: currentMenuData.childMenu }})
                    if(currentMenuData.childMenu != "paint") applyCurrentModPreview()
                }
                if(currentMenuData.type == "upgrade"){
                    store.dispatch({
                        type: "DIALOG_SHOW", 
                        action: "installMod", 
                        label: "BUY AND INSTALL", 
                        header: "COST:", 
                        price: currentMenuData.price,
                        modId: currentMenuData.modId,
                        id: currentMenuData.id
                    })
                } 
            }
        } else if(event.key == "Backspace"){
            var currentState = store.getState()
            var currentMenuData = currentState.Menu.menus[currentState.Menu.activeMenu]

            if(currentMenuData.parentMenu != undefined){
                Nui.post("enteredMenu", { menuName: currentMenuData.parentMenu })
                store.dispatch({type: "SET_ACTIVE_MENU", payload: { menu: currentMenuData.parentMenu }})
            }
        } else if(event.key == "Escape"){
            var currentState = store.getState()
            if(!currentState.Dialog.activeDialog) {
                store.dispatch({type: "DIALOG_SHOW", action: "closeUI", label: "CLOSE SHOP"})
            }
        }
    }

    const applyCurrentModPreview: void = () => {
        var currentState = store.getState()
        var currentMenuData = currentState.Menu.menus[currentState.Menu.activeMenu].list[currentState.Menu.menus[currentState.Menu.activeMenu].activeElement]
        if(currentMenuData.type == "upgrade"){
            Nui.post("applyMod", { modId: currentMenuData.modId, id: currentMenuData.id })
        }
    }

    const initMenus: void = () => {
        const menus = store.getState().Menu.menus
        for(var item in menus){
            store.dispatch({ type: "INIT_MENU", payload: { menu: item } })
        }
    }    

    return (
        <div>
            <Loading />
            <Container hidden={!show}>
                <Cash />
                <Dialog />
                <MainMenu />
                <Customize />
                <Body />
                <Performance />
                <MiscMenus />
                <Paint />
                <Stance />
                <Legend />
            </Container>
        </div>
    )
}

export default App
