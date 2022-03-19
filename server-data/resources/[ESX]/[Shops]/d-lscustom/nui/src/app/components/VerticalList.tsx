import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';
import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import '../App.css';

const Container = styled.div`
    position: relative;
`;

const ScrollContainer = styled.div`
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
`;

const Tab = styled.div`
    height: 4vh;
    width: 100%;
    position: relative;
    background: rgb(0,0,0);
    margin-bottom: .75vh;
    padding-left: 2.45vh;
    padding-right: 2.45vh;
    text-align: center;
    color: white;
    transition: background .1s, color .1s;
`;

const Label = styled.div`
    position: absolute;
    bottom: 50%;
    left: 3%;
    transform: translateY(50%);
    font-family: HeatMain;
    font-size: larger;
    text-transform: uppercase;
`
const VerticalList = ({ data }) => {
    const elements = useSelector((state: any) => state.Paint[data.tabName].list);
    const active = useSelector((state: any) => state.Paint[data.tabName].activeElement);
    const scrollElement = useSelector((state: any) => state.Paint[data.tabName].scrollElement);

    const activeTabStyle = {
        background: 'rgb(255,255,255)',
        color: 'black',
    }

    return (
        <Container hidden={!data.activeTab} style={{ top: `-${scrollElement * 4.75}vh` }}>
            <ScrollContainer>
                {elements.map((x, index) => <Tab key={index} style={index == active ? activeTabStyle : {}}><Label>{x.name.toUpperCase()}</Label></Tab>)}
            </ScrollContainer>
        </Container>
    )
}

export default VerticalList
