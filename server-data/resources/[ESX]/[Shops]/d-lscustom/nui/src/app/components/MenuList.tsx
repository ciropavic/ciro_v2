import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import { connect } from 'react-redux'
import MenuElement from "./MenuElement";
import '../App.css';

const Container = styled.div`
    position: absolute;
    bottom: 11vh;
    left: 9.25vh;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    align-items: center;
    height: 18.75vh;
`;

const MenuList = ({ data }) => {
    const [menuList, updateMenuList] = useState([])
    const [currentElement, updateCurrentElement] = useState(1)
    const [currentElementType, updateCurrentElementType] = useState("")
    const [listSlide, setListSlide] = useState(0)

    useEffect(() => {
        store.subscribe(generateList)
        updateMenuList(generateList)
        updateCurrentElement(1)
        updateCurrentElementType(getCurrentElementType)
        setListSlide(getListSlide)
    }, [])

    const generateList: array = () => {
        var list = store.getState().Menu.menus[data.menuName].list.map((x) => <MenuElement key={x.name} data={{...x, menuName: data.menuName, installed: store.getState().Menu.menus[data.menuName].currentMod === x.id }}/>)
        updateMenuList(list)
        updateCurrentElement(store.getState().Menu.menus[data.menuName].activeElement + 1)
        updateCurrentElementType(getCurrentElementType)
        setListSlide(getListSlide)
        return
    }

    const menuHeaderStyle = {
        position: 'absolute',
        fontFamily: 'Heat',
        fontSize: '3.5vh',
        color: 'white',
        top: '-5.3vh',
    }

    const getListSlide: number = () => {
        return store.getState().Menu.menus[data.menuName].list[store.getState().Menu.menus[data.menuName].activeElement].type == 'upgrade' ? 0 - ((store.getState().Menu.menus[data.menuName].activeElement) * 31.5) : 0
    }

    const getCurrentElementType: string = () => {
        return store.getState().Menu.menus[data.menuName].list[store.getState().Menu.menus[data.menuName].activeElement].type != null ? store.getState().Menu.menus[data.menuName].list[store.getState().Menu.menus[data.menuName].activeElement].type : ""
    }

    return (
        <Container>
            <span hidden={data.menuName == null} style={menuHeaderStyle}>{data.menuName.toUpperCase()} {store.getState().Menu.menus[data.menuName].activeElement + 1}/{menuList.length}</span>
            <div style={{ display: 'flex', alignItems: 'center', position: 'relative', left: `${listSlide}vh`, overflow: 'hidden' }}>{menuList}</div>
        </Container>
    )
}

export default MenuList
