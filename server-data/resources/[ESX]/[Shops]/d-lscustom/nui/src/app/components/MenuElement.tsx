import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import '../App.css';
import { Icons } from './Icons'

import icon from '../../images/dollah.png'

const Container = styled.div`
    position: relative;
    width: 30.5vh;
    height: 16.75vh;
    background: rgba(0,0,0,0.7);
    color: white;
    margin-right: 1vh;
`;

const Label = styled.div`
    position: absolute;
    bottom: 7%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: Heat;
    font-size: x-large;
`

const Price = styled.div`
    right: 0;
    position: absolute;
    color: yellow;
    background: black;
    font-family: Heat;
    font-size: x-large;
    padding-top: 0.5vh;
    padding-bottom: 0.5vh;
    padding-right: 1vh;
    padding-left: 2.75vh;
    text-align: center;
    margin: 0 auto;
`

const Installed = styled.div`
    right: 0;
    position: absolute;
    color: cyan;
    background: black;
    font-family: Heat;
    font-size: x-large;
    padding-top: 0.5vh;
    padding-bottom: 0.5vh;
    padding-right: 1vh;
    padding-left: 1vh;
    text-align: center;
    margin: 0 auto;
`

const Icon = styled.img`
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    height: 50%;
`

const MenuElement = ({ data }) => {
    const activeStyle = {
        background: 'rgba(255,255,255,1.0)',
        color: 'black',
        transition: 'background .05s, color .05s',
    }

    const lockedElement = {
        color: 'grey',
    }

    const activeUpgradeStyle = {
        background: 'rgba(255,255,255,1.0)',
        color: 'black',
        width: '33.75vh',
        height: '18.75vh',
        transition: 'width .1s, height .1s',
    }

    const menuStyle = {
        position: 'absolute',
        bottom: '7%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        fontFamily: 'Heat',
        fontSize: 'x-large',
    }

    const upgradeElementStyle = {
        position: 'absolute',
        bottom: '7%',
        right: '6%',
        fontFamily: 'HeatMain',
        fontSize: 'x-large',
    }

    const getPriceString: string = () => {
        var string = data.price;
        return "$$$";
    }

    const activeIconStyle = {
        filter: 'invert(100%)',
    }

    const lockedElementIcon = {
        filter: 'invert(100%) opacity(0.5)',
    }

    const priceIcon = {
        position: 'absolute',
        top: '50%',
        transform: 'translateY(-50%)',
        left: '8%',
        width: '2vh',
    }

    const iconName = data.icon || (data.name != null ? data.name.toLowerCase() : null);
    const upgradeIconName = data.icon || data.menuName.toLowerCase();

    const hasChildElements: boolean = () => {
        var currentState = store.getState()
        return (data.childMenu && currentState.Menu.menus[data.childMenu.toLowerCase()] && currentState.Menu.menus[data.childMenu.toLowerCase()].list[0] != null) || data.type == "upgrade"
    }

    return (
        <Container style={(data != null && data.active == true) ? (data.type == "upgrade" ? activeUpgradeStyle : activeStyle) : (hasChildElements() == true ? {} : lockedElement) }>
            {(data.installed && data.type == "upgrade") ? <Installed><i class="fas fa-check-circle"></i></Installed>
                : 
            data.price != null && <Price>
                <img src={icon} style={priceIcon} /> {data.price.toLocaleString('en', {useGrouping:true})}
            </Price>}
            { Icons[iconName] != null && <Icon style={(data.active != true ? (hasChildElements() == true ? activeIconStyle : lockedElementIcon) : null)} src={Icons[iconName]} /> }
            { (data.type == "upgrade" && Icons[upgradeIconName] ) && <Icon style={(data.active != true ? activeIconStyle : null)} src={Icons[upgradeIconName]} /> }
            <span></span>
            <div style={data.type == "upgrade" ? upgradeElementStyle : menuStyle}>{data.label != null ? data.label : ""}</div>
        </Container>
    )
}

export default MenuElement
