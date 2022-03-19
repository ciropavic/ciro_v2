import React from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../Nui";
import { store } from "../index";
import MenuList from "./components/MenuList";
import VehicleDetails from "./components/VehicleDetails"
import { menus } from "./config"

const MenuItems = [{ name: "PERFORMANCE", active: true, type: "upgrade", price: 5000 }, { name: "CUSTOMIZATION", price: 2000, type: 'upgrade' }, { name: "LOCKED" }]

const Container = styled.div`
    position: absolute;
    width: 100%;
    height: 100%;
`;

const Body = () => {
    const currentMenu: string = useSelector((state: any) => state.Menu.activeMenu)

    return (
        <Container hidden={currentMenu != "body"}>
            <MenuList data={{ menuName: "body" }} />
        </Container>
    )
}

export default Body