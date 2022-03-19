interface DialogState {
    activeDialog: boolean,
    options: Array<string>,
    activeOption: number,
    action: string,
    label: string,
    header: string,
    price: number,
    modId: number,
    id: number,
    loading: boolean
}

const initialState = {
    activeDialog: false,
    options: ['yes', 'no'],
    activeOption: 0,
    action: "INSTALL_UPGRADE",
    label: "Buy and install",
    header: "COST:",
    price: 1000,
    modId: 0,
    id: 0,
    loading: false,
};

const Dialog = (state: DialogState = initialState, data: any) => {
    switch(data.type) {
        case "DIALOG_SHOW":
            return { 
                ...state, 
                activeDialog: true, 
                activeOption: 0, 
                action: data.action,
                header: data.header,  
                label: data.label,
                price: data.price,
                modId: data.modId,
                id: data.id,
            }
        case "DIALOG_HIDE":
            return { ...state, activeDialog: false }
        case "DIALOG_MOVE_UP":
            var newOption = state.activeOption - 1 < 0 ? state.options.length - 1 : state.activeOption - 1
            return { ...state, activeOption: newOption }
        case "DIALOG_MOVE_DOWN":
            var newOption = state.activeOption + 1 >= state.options.length ? 0 : state.activeOption + 1
            return { ...state, activeOption: newOption }
        case "SET_LOADING_STATE":
            return { ...state, loading: data.state }
        default:
            return state
    }
}

export default Dialog;
