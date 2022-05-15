import { colorsList, paintTypes } from "../config"



const generateState = () => { 
    var obj: any = {};
    paintTypes.map(x => {
        obj[x] = {
            list: colorsList,
            activeElement: 0,
            scrollElement: 0,
            price: 1337,
        }
    })
    return obj
}

const initialState = generateState();

const Paint = (state = initialState, data: any) => {
    switch(data.type) {
        case "UPDATE":
            state[data.paintType].list = data.value
            return state
        case "PAINT_MOVE_DOWN":
            var typeObj = state[data.paintType]
            typeObj.activeElement = typeObj.activeElement + 1 >= typeObj.list.length ? 0 : typeObj.activeElement + 1
            if(typeObj.list.length > 12){
                if(typeObj.activeElement == 0){
                    typeObj.scrollElement = 0
                } else {
                    if(typeObj.activeElement - typeObj.scrollElement >= 12){
                        typeObj.scrollElement++;
                    }
                }
            }
            return { ...state, [data.paintType]: typeObj }
        case "PAINT_MOVE_UP":
            var typeObj = state[data.paintType]
            typeObj.activeElement = typeObj.activeElement - 1 < 0 ? typeObj.list.length - 1 : typeObj.activeElement - 1
            if(typeObj.list.length > 12){
                if(typeObj.activeElement == typeObj.list.length - 1){
                    typeObj.scrollElement = typeObj.list.length - 12
                } else {
                    if(typeObj.scrollElement - typeObj.activeElement > 0){
                        typeObj.scrollElement--;
                    }
                }
            }
            return { ...state, [data.paintType]: typeObj }
        case "PAINT_RESET":
            var obj = { ...state };
            for(var menu in obj){
                obj[menu].activeElement = 0;
                obj[menu].scrollElement = 0;
            }

            return { ...obj }
        case "PAINT_UPDATE_PRICES":
            var obj = { ...state };
            for(var menu in data.list){
                obj[menu].price = data.list[menu];
            }

            return { ...obj }
        default:
            return state
    }
}

export default Paint;
