import React from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import MenuList from "./components/MenuList";
import { menus } from "./config"

const Container = styled.div`
    position: relative;
    margin-top: 1vh;
`;

const BarPlaceholder = styled.div`
    width: 75%;
    height: 75%;
    background: rgba(255,255,255,0.2);
    box-shadow:0px 0px 0px 1px rgba(255,255,255,0.4) inset;

`

const Bar = styled.div`
    width: 30%;
    height: 100%;
    background: white;
`

const BarPointer = styled.div`
    float: right;
    width: 0.25vh;
    height: 100%;
    background: grey;
`

const ValueLabel = styled.span`
    color: white;
    font-family: Heat;
`

const ValueBlock = styled.div`
    position: relative;
    width: 12%;
    height: 100%;
    background: white;
`

const ValueText = styled.span`
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: Heat;
    font-size: x-large;
`


const VehicleDetails = ({ data }) => {
    return (
        <Container>
            <ValueLabel>{data.name}</ValueLabel>
            <div style={{ width: '100%', height: '2.25vh', display: 'flex', flexWrap: 'wrap', flexDirection: 'row', alignItems: 'center' }}>
                <BarPlaceholder>
                    <Bar style={{ width: `${data.value * 10}%` }}><BarPointer /></Bar>
                </BarPlaceholder>
                <ValueBlock>
                    <ValueText>
                        {data.value}
                    </ValueText>
                </ValueBlock>
            </div>
        </Container>
    )
}

export default VehicleDetails