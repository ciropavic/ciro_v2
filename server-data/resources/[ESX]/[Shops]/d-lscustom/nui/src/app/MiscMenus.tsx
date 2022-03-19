import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../Nui";
import { store } from "../index";
import MenuList from "./components/MenuList";
import VehicleDetails from "./components/VehicleDetails"
import { menus, staticMenus } from "./config"

const MenuItems = [{ name: "PERFORMANCE", active: true, type: "upgrade", price: 5000 }, { name: "CUSTOMIZATION", price: 2000, type: 'upgrade' }, { name: "LOCKED" }]

const Container = styled.div`
    position: absolute;
    width: 100%;
    height: 100%;
`;

const MiscMenus = () => {
    const currentMenu = useSelector((state: any) => state.Menu.activeMenu);
    const menuNameList = useSelector((state: any) => state.Menu.menuList);
    const menuUpdated = useSelector((state: any) => state.Menu.menuUpdated);
    const [menuList, updateMenuList] = useState([])
    //var currentMenu = "";

    /*useEffect(() => {
        store.subscribe(generateList)
        generateList()
    }, [])*/
    useEffect(() => {
        generateList()
    }, [currentMenu, menuUpdated])

    const generateList: array = () => {
        //currentMenu = store.getState().Menu.activeMenu
        const menus: array = store.getState().Menu.menus
        var menusList: array = [];
        for(var category in menus){
            if(!staticMenus.includes(category) && menus[category].list.length > 0) {
                menusList.push(<div key={category} hidden={ currentMenu.toLowerCase() != category.toLowerCase() }><MenuList data={{ menuName: category }} /></div>)
            }
        }
        updateMenuList(menusList)
        return
    }

    return (
        <Container>
            {menuList}
        </Container>
    )
}

export default MiscMenus