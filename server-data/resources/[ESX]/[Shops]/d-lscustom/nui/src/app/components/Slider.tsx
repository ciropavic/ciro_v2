import React, { useState, useEffect, useRef } from 'react';
import styled, { css } from 'styled-components';


const Header = styled.div`
    padding-top: 1.75vh;
    padding-left: 2vh;
    background-color: rgba(0,0,0,0.4);
    padding-bottom: 1.75vh;
    font-family: Heat;
    font-size: 3vh;
    color: white;
`;

const Container = styled.div`
    position: relative;
    width: 100%;
    background-color: rgba(0,0,0,0.4);
    height: 8.5vh;
`;

const ContainerStyle = {
    'background-color': 'rgba(0,0,0,0.4)'
}

const activeContainerStyle = {
    'background-color': 'rgba(255,255,255,1.0)'
}

const SliderHeader = styled.div`
    padding-top: 0.5vh;
    color: white;
    font-family: HeatMain;
    font-size: 1.75vh;
    text-align: center;
`;

const SliderHeaderStyle = {
    'color': 'white'
}

const activeSliderHeaderStyle = {
    'color': 'black'
}

const SliderLabel = styled.span`
    color: white;
    font-family: HeatMain;
    font-size: 1.75vh;
`;

const SliderLabelStyle = {
    'color': 'white'
}

const activeSliderLabelStyle = {
    'color': 'black'
}

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

const ColumnStyle = {
    'background-color': 'rgba(255,255,255)'
}

const activeColumnStyle = {
    'background-color': 'rgba(0,0,0)'
}

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

const LineStyle = {
    'background-color': 'rgba(255,255,255)'
}

const activeLineStyle = {
    'background-color': 'rgba(0,0,0)'
}

const Circle = styled.div`
    position: absolute;
    height: 1.5vh;
    width: 1.5vh;
    border-radius: 50px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255,255,255);
    transition: 0.2s;
`;

interface SliderData {
    name: string,
    label: string,
    active: boolean,
    min: number,
    max: number,
    current: number
}

const Slider: React.FC<SliderData> = ({ name, label, active, min, max, current }) => {

    const CircleStyle = {
        'background-color': 'rgba(255,255,255)',
        'left': `${(current - min) / (max - min) * 100}%`
    }
    
    const activeCircleStyle = {
        'background-color': 'rgba(0,0,0)',
        'left': `${(current - min) / (max - min) * 100}%`
    }

    return (
        <Container style={active ? activeContainerStyle : ContainerStyle }>
            <SliderHeader style={active ? activeSliderHeaderStyle : SliderHeaderStyle}>{label}</SliderHeader>
            <ColumnsContainer>
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <Column style={active ? activeColumnStyle : ColumnStyle} />
                <div style={{ 'position': 'absolute', 'width': '88.5%', 'top': '50%', 'left': '50%', transform: 'translateX(-50%)'  }}>
                    <Circle style={active ? activeCircleStyle : CircleStyle}/>
                </div>
            </ColumnsContainer>
            <Line style={active ? activeLineStyle : LineStyle} />
            
            
            
            <div>
                <SliderLabel style={active ? activeSliderLabelStyle : SliderLabelStyle}><span style={{ 'float': 'left', 'margin-left': '1.4vh'}}>INNER</span></SliderLabel>
                <SliderLabel style={active ? activeSliderLabelStyle : SliderLabelStyle}><span style={{ 'float': 'right', 'margin-right': '1.4vh'}}>OUTTER</span></SliderLabel>
            </div>
        </Container>
    )
}

export default Slider