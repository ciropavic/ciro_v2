import { combineReducers } from "redux";
import Show from "./app/reducers/Reducer"
import Menu from "./app/reducers/MenuReducer"
import Paint from "./app/reducers/PaintReducer"
import Dialog from "./app/reducers/DialogReducer"
import Slider from "./app/reducers/SliderReducer"

export default combineReducers({
    Show, 
    Menu,
    Paint,
    Dialog,
    Slider
})