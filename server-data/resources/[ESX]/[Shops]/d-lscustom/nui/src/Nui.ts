import 'regenerator-runtime/runtime';

let events: {[key: string]: Function} = {}

export default class Nui {

    public static async post(event: string, data = {}, resName = GetParentResourceName()) {
        try {
            const res = await fetch(`https://${resName}/${event}`, {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify(data),
            })
            const body = await res.json();
            return body;
        } catch(e) {
            //console.log(e);
        }
    }

    public static onEvent(type: string, func: Function) {
        if (events[type]) {
            console.log(
                `%c[Nui.onEvent]%c: Event ${type} is already declared.`,
                "color: red;", "color: white;"
            )
            return;
        }
        events[type] = func
    }

    public static emitEvent(type: string, payload: any) {
        window.dispatchEvent(new MessageEvent("message", {
            data: {type, payload}
        }))
    }
};

export const EventListener = () => {
    window.addEventListener('message', (e: MessageEvent) => {
        if (!events[e.data.type]) return;
        events[e.data.type](e.data.payload)
    });

    return null;
}
