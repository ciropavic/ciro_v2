import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../../Nui";
import { store } from "../../index";

import icon from '../../images/dollah_dark.png'

const Container = styled.div`
    position: fixed;
    color: black;
    background: yellow;
    font-family: Heat;
    font-size: x-large;
    padding-top: 0.5vh;
    padding-bottom: 0.5vh;
    padding-right: 1vh;
    padding-left: 3.25vh;
    text-align: center;
    margin: 0 auto;
    top: 5%;
    right: 5%;
    z-index: 15;
`;

const colors = {
    wallet: 'yellow',
    society: 'lime',
}

const Cash = () => {
    const [cash, setCash] = useState(500000)
    const [cashType, setCashType] = useState("society");

    useEffect(() => {
        Nui.onEvent("UPDATE_CASH", (payload: any) => {
            setCash(payload)
        })

        Nui.onEvent("SET_MONEY_TYPE", (payload: any) => {
            setCashType(payload)
        })
    }, [])

    const priceIcon = {
        position: 'absolute',
        top: '50%',
        transform: 'translateY(-50%)',
        left: '8%',
        width: '2vh',
    }

    return (
        <Container style={{ background: colors[cashType] }}>
        	<img src={icon} style={priceIcon} /> {cash.toLocaleString('en', {useGrouping:true})}
        </Container>
    )
}

export default Cash