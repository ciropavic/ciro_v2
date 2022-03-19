import { sliders, sliderConfig } from "../config"

interface Slider {
    label: string,
    name: string,
    min: number,
    max: number,
    current: number,
    step: number,
}

const generateState = () => { 
    let obj: Array<Slider> = [];
    sliders.map(x => {
        obj.push({
            ...x,
            step: (x.max - x.min) / 20
        })
    })

    return {
        sliders: obj,
        active: 0,
        updated: Date.now()
    };
}

const initialState = generateState();

const Sliders = (state = initialState, data: any) => {
    switch(data.type) {
        case "SLIDER_UPDATE":
            for(var item in data.payload){
                for(var i = 0; i < state.sliders.length; i++){
                    if(state.sliders[i].name == item){
                        state.sliders[i].min = data.payload[item].min;
                        state.sliders[i].max = data.payload[item].max;
                        state.sliders[i].current = data.payload[item].current;
                    }
                }
            }
            return {...state, updated: Date.now(), active: 0 };
        case "SLIDER_MOVE_LEFT":
            var sliders = state.sliders;
            if(sliders[state.active].current - sliders[state.active].step >= sliders[state.active].min){
                sliders[state.active].current = parseFloat((sliders[state.active].current - sliders[state.active].step).toFixed(4));
                return { ...state, sliders: [...sliders] }
            } 
            return state;
        case "SLIDER_MOVE_RIGHT":
            var sliders = state.sliders;
            if(sliders[state.active].current + sliders[state.active].step <= sliders[state.active].max){
                sliders[state.active].current = parseFloat((sliders[state.active].current + sliders[state.active].step).toFixed(4));
                return { ...state, sliders: [...sliders] }
            } 
            return state;
        case "SLIDER_MOVE_UP":
            var active = state.active - 1 < 0 ? state.sliders.length - 1 : state.active - 1;
            return { ...state, active: active };
        case "SLIDER_MOVE_DOWN":
            var active = state.active + 1 >= state.sliders.length ? 0 : state.active + 1;
            return { ...state, active: active };
        case "SLIDER_RESET":
            return {...generateState()}
        default:
            return state
    }
}

export default Sliders;
