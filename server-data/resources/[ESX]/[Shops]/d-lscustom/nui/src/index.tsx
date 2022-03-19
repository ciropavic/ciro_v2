import React from 'react';
import ReactDOM from 'react-dom';
import { useSelector as useReduxSelector, Provider, TypedUseSelectorHook } from 'react-redux';
import { createStore } from "redux";


import rootReducer from "./Reducers";
import App from './app/App';
import { EventListener } from "./Nui"

export const store = createStore(rootReducer, window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__());

type RootState = ReturnType<typeof rootReducer>;
export const useSelector: TypedUseSelectorHook<RootState> = useReduxSelector

ReactDOM.render(
    <Provider store={store}>
        <App/>
        <EventListener/>
    </Provider>,
    document.getElementById('app'),
);