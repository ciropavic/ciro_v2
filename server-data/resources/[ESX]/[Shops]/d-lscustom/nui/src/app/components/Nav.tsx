import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';
import { useSelector } from '../../index';
import Nui from "../../Nui";
import { store } from "../../index";
import '../App.css';

const Container = styled.div`
    position: fixed;
    top: 5.75%;
    left: 4.9%;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    height: 18.75vh;
`;

const Tab = styled.div`
    height: 3.5vh;
    line-height: 3.5vh;
    background: rgba(0,0,0,0.7);
    position: relative;
    margin: .05vh;
    padding-left: 2.45vh;
    padding-right: 2.45vh;
    transition: background .1s, color .1s;
`;

const Btn = styled.div`
    position: relative;
    min-width: 1.4vh;
    max-width: 4vh;
    height: 1.4vh;
    padding: 0.5vh;
    background: white;
    color: black;
    border-radius: 7px;
    box-shadow: 0 0 10px 5px (70,70,70,0.9);
    font-family: HeatMain;
    font-size: large;
    color: black;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
`;

const BtnLabel = styled.div`
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
`

const Label = styled.span`
    font-family: Heat;
    font-size: larger;
    color: white;
`;

const Nav = ({ data }) => {
    useEffect(() => {
        document.addEventListener("keydown", keyPress, false);
        return () => document.removeEventListener("keydown", keyPress, false);
    }, []);

    const keyPress: void = (event) => {
        if(store.getState().Dialog.loading) return
        if(event.key == "q"){
            data.navLeft()
        } else if(event.key == "e"){
            data.navRight()
        }

        event.preventDefault();
    }

    return (
        <Container>
            <Tab><Btn><BtnLabel>Q</BtnLabel></Btn></Tab>
            {data.elements.map((x, index) => {
                return (<Tab key={index} style={{ background: (data.activeElement.current == index ? 'rgb(255,255,255)' : '') }}>
                    <Label style={{ color: (data.activeElement.current == index ? 'rgb(0,0,0)' : '') }}>{x.toUpperCase()}</Label>
                </Tab>)
            })}
            <Tab><Btn><BtnLabel>E</BtnLabel></Btn></Tab>
        </Container>
    )
}

export default Nav
