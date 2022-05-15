import { menus, menuList } from "../config"

interface State {
    activeMenu: string,
    menus: object,
    menuList: Array<string>,
    menuUpdated: number
}

const initialState = {
    activeMenu: "general",
    menus: menus,
    menuList: menuList,
    menuUpdated: 0,
}

const Menu = (state: State = initialState, data: any) => {
    switch(data.type) {
        case "UPDATE":
            return { ...state, [data.payload.prop]: data.payload.value }
        case "INIT_MENU":
            var menus = state.menus
            if(menus[data.payload.menu].list[0] == null) return state
            menus[data.payload.menu].activeElement = 0
            //menus[data.payload.menu].list[menus[data.payload.menu].activeElement].active = false
            menus[data.payload.menu].list[0].active = true
            return { ...state, menus: {...menus}, activeMenu: "general" }
        case "MOVE_RIGHT":
            var menus = state.menus
            if(menus[state.activeMenu] == null) return state
            var nextElement = menus[state.activeMenu].activeElement + 1 > menus[state.activeMenu].list.length - 1 ? 0 : (menus[state.activeMenu].activeElement + 1)
            
            state.menus[state.activeMenu].list[menus[state.activeMenu].activeElement].active = false
            state.menus[state.activeMenu].activeElement = nextElement
            state.menus[state.activeMenu].list[menus[state.activeMenu].activeElement].active = true

            return { ...state, menus: {...menus} }
        case "MOVE_LEFT":
            var menus = state.menus
            if(menus[state.activeMenu] == null) return state
            var nextElement = menus[state.activeMenu].activeElement - 1 < 0 ? menus[state.activeMenu].list.length - 1 : menus[state.activeMenu].activeElement - 1
            
            state.menus[state.activeMenu].list[menus[state.activeMenu].activeElement].active = false
            state.menus[state.activeMenu].activeElement = nextElement
            state.menus[state.activeMenu].list[menus[state.activeMenu].activeElement].active = true
            return { ...state, menus: {...menus} }
        case "SET_ACTIVE_MENU":
            return { ...state, activeMenu: data.payload.menu }
        case "OVERRIDE_MENU_OBJECT":
            var newData = {...data.payload}
            for(var item in newData){
                if(newData[item].list[0] != null){
                    newData[item].activeElement = 0;
                    newData[item].list[0].active = true;
                }
            }
            return { ...state, activeMenu: 'general', menus: { ...newData }, menuUpdated: Date.now() }
        case "EMPTY_LISTS":
            var menus = state.menus;
            for(var menu in menus){
                menus[menu].list = [{
                    modId: 0,
                    id: 0,
                    name: "DEBUG",
                    type: "upgrade",
                    price: 1337,
                    active: true
                }];
                menus[menu].activeElement = 0
            }
            
            return { ...state, menus: menus }
        case "SET_INSTALLED_MOD":
            var id = state.menus[state.activeMenu].list[state.menus[state.activeMenu].activeElement].id
            state.menus[state.activeMenu].currentMod = (typeof id == "number" ? id : state.menus[state.activeMenu].activeElement );
            return { ...state, menus: {...state.menus} }
        default:
            return state
    }
}

export default Menu;
