import React, { useState, useEffect, useRef } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../index';
import Nui from "../Nui";
import { store } from "../index";
import { menus, colorsList } from "./config"
import Nav from "./components/Nav";
import VerticalList from './components/VerticalList';
import Slider from './components/Slider';

const Container = styled.div`
    position: absolute;
    width: 100%;
    height: 100%;
`;

const StanceContainer = styled.div`
    position: absolute;
    top: 12%;
    left: 5%;
    width: 38.5vh;
    background: rgba(0,0,0,0.2);
`

const Header = styled.div`
    padding-top: 1.75vh;
    padding-left: 2vh;
    padding-bottom: 1.75vh;
    font-family: Heat;
    font-size: 3vh;
    color: white;
    background-color: rgba(0,0,0,0.4);
`;

const SliderContainer = styled.div`
    position: relative;
    background-color: rgba(0,0,0,0.4);
    width: 100%;
    height: 8.5vh;
`;

const SliderHeader = styled.div`
    padding-top: 0.5vh;
    color: white;
    font-family: HeatMain;
    font-size: 1.75vh;
    text-align: center;
`;

const SliderLabel = styled.span`
    color: white;
    font-family: HeatMain;
    font-size: 1.75vh;
`;

const ColumnsContainer = styled.div`
    padding-top: 1vh;
    padding-bottom: 0.4vh;
    padding-left: 0.55vh;
    padding-right: 0.55vh;
    display: flex;
    
`;

const Column = styled.div`
    height: 1.1vh;
    width: 2px;
    margin: auto;
    background-color: rgb(255,255,255);
`;

const Line = styled.div`
    position: absolute;
    height: 2px;
    width: 87%;
    padding-left: 0.55vh;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgb(255,255,255);
`;

const Circle = styled.div`
    position: absolute;
    height: 1.5vh;
    width: 1.5vh;
    border-radius: 50px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255,255,255);
`;

const paintTypes = ['primary', 'secondary', 'pearlescent', 'wheels'];

const Stance = () => {
    const sliders = useSelector((state: any) => state.Slider.sliders);
    const active = useSelector((state: any) => state.Slider.active);
    const updated = useSelector((state: any) => state.Slider.updated);
    const [slidersList, updateSlidersList] = useState([]);
    const currentMenu: string = useSelector((state: any) => state.Menu.activeMenu)
    const throttle = useRef(false);

    useEffect(() => {
        document.addEventListener("keydown", keyPress, false);

        return () => document.removeEventListener("keydown", keyPress, false);
    }, []);

    useEffect(() => {
        generateSliders();
    }, [sliders, active, updated])

    const generateSliders: any = () => {
        let slidersList: any = [];
        for(let i = 0; i < sliders.length; i++){
            slidersList.push(<Slider {...sliders[i]} active={i == active}></Slider>);
        }
        updateSlidersList(slidersList);
        return
    }

    const keyPress = (event: any) => {
        event.preventDefault();
        if(store.getState().Dialog.loading) return
        if(store.getState().Menu.activeMenu != "stance") return
        if(store.getState().Dialog.activeDialog) return
        if(throttle.current == true) return

        throttle.current = true
        setTimeout(() => throttle.current = false, 100)

        const state = store.getState();

        if(event.key == "ArrowDown"){
            store.dispatch({ type: "SLIDER_MOVE_DOWN" })
        } else if(event.key == "ArrowUp"){
            store.dispatch({ type: "SLIDER_MOVE_UP" })
        } else if(event.key == "ArrowLeft"){
            store.dispatch({ type: "SLIDER_MOVE_LEFT" })
            Nui.post("applyMod", { modId: "stance", id: state.Slider.sliders[state.Slider.active].name, value: state.Slider.sliders[state.Slider.active].current })
        } else if(event.key == "ArrowRight"){
            store.dispatch({ type: "SLIDER_MOVE_RIGHT" })
            Nui.post("applyMod", { modId: "stance", id: state.Slider.sliders[state.Slider.active].name, value: state.Slider.sliders[state.Slider.active].current })
        } else if(event.key == "Enter") {
            store.dispatch({type: "DIALOG_SHOW", action: "installMod", label: "INSTALL PRESET?", modId: "stance" })
        }
    }

    return (
        <Container hidden={currentMenu != "stance"}>
            <StanceContainer>
                <Header>STANCE</Header>
                {slidersList}
            </StanceContainer>
        </Container>
    )
}

export default Stance