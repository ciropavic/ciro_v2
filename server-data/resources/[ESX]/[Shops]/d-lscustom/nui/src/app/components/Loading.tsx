import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';

import { useSelector } from '../../index';

const Container = styled.div`
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 15;
`;

const Loading = () => {
    const loadingState: boolean = useSelector((state: any) => state.Dialog.loading);

    return (
        <Container hidden={!loadingState}>
        	<svg style={{ margin: 'auto', display: 'block', shapeRendering: 'auto' }} width="200px" height="200px" viewBox="0 0 100 100" >
			<circle cx="50" cy="50" fill="none" stroke="#fcfcfc" strokeWidth="2" r="35" strokeDasharray="164.93361431346415 56.97787143782138">
			  	<animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 50 50;360 50 50" keyTimes="0;1"></animateTransform>
			</circle>
			</svg>
        </Container>
    )
}

export default Loading