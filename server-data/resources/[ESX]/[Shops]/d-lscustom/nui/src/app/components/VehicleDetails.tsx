import React from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import ValueBar from "./ValueBar"
import { menus } from "./config"

const Container = styled.div`
    position: absolute;
    top: 12.5%;
    left: 5.25%;
    width: 34vh;
    height: 30vh;
    padding: 2vh;
    border-top: 2px solid white;
    background: rgba(0,0,0,0.8);
`;

const VehicleName = styled.span`
    position: relative;
    color: white;
    font-family: Heat;

    font-size: xx-large;
`;

const VehicleDetails = () => {
    return (
        <Container hidden={false}>
            <VehicleName>GTR'</VehicleName>
            <ValueBar data={{ value: 5.0, name: "POWER" }} />
            <ValueBar data={{ value: 5.0, name: "HIGH SPEED" }} />
            <ValueBar data={{ value: 5.0, name: "ACCELERATION" }} />
            <ValueBar data={{ value: 5.0, name: "HANDLING" }} />
        </Container>
    )
}

export default VehicleDetails