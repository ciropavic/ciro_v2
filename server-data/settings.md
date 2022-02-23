# All ECRP Exports

## Table of Contents

- [All ECRP Exports](#all-ecrp-exports)
  - [Table of Contents](#table-of-contents)
  - [Exports](#exports)
    - [Drawtextui](#drawtextui)
    - [onyxLockSystem](#onyxlocksystem)
    - [Ox Inventory](#ox-inventory)
    - [Mythic Notify](#mythic-notify)
  - [Changes](#changes)
  - [Vehicles](#vehicles)
  - [Color Theme](#color-theme)

---

## Exports

---

### Drawtextui

- Show UI:

  ```lua
  TriggerEvent('cd_drawtextui:ShowUI', 'show', TEXT_HERE, 'color2', 'color2')
  ```

- Hide UI:

  ```lua
  TriggerEvent('cd_drawtextui:HideUI')
  ```

### onyxLockSystem

- Give Keys:

  ```lua
  local plate = GetVehicleNumberPlateText(vehicle)
  exports["onyxLocksystem"]:givePlayerKeys(plate)
  ```

### Ox Inventory

- Progress:

  ```lua
  exports.ox_inventory:Progress({
    duration = 2000,
    label = 'Drinking water',
    useWhileDead = false,
    canCancel = true,
    disable = {
        move = false,
        car = true,
        combat = true,
        mouse = false
    },
    anim = {
        dict = 'mp_player_intdrink',
        clip = 'loop_bottle',
        flags = 49,
    },
    prop = {
        model = 'prop_ld_flow_bottle',
        pos = { x = 0.03, y = 0.03, y = 0.02},
        rot = { x = 0.0, y = 0.0, y = -1.5},
        bone = 58866
    },
  }, function(cancel)
      if not cancel then
          print("You drank some water - that'll quench ya!")
      end
  end)
  ```

### Mythic Notify

- Client:
  - Simple
    ```lua
    exports['mythic_notify']:DoHudText('type', 'message')
    ```
  - Advanced
    ```lua
    exports['mythic_notify']:DoHudText('inform', 'Hype! Custom Styling!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    ```
- Server:
  - Simple
    ```lua
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Hype! Custom Styling!'})
    ```
  - Advanced
    ```lua
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Hype! Custom Styling!', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    ```

---

## Changes

- MySQL -> Oxmysql
  ```lua
    '@mysql-async/lib/MySQL.lua' -> '@oxmysql/lib/MySQL.lua',
  ```

---

## Vehicles

<details>
  <summary>Vehicle Changes</summary>

- Carcols:

  <details>
    <summary>Engine Upgrade</summary>

  ```xml
  <Item>
    <identifier />
    <modifier value="25" />
    <audioApply value="1.000000" />
    <weight value="20" />
    <type>VMT_ENGINE</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="50" />
    <audioApply value="1.000000" />
    <weight value="20" />
    <type>VMT_ENGINE</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="100" />
    <audioApply value="1.000000" />
    <weight value="20" />
    <type>VMT_ENGINE</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="150" />
    <audioApply value="1.000000" />
    <weight value="20" />
    <type>VMT_ENGINE</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="200" />
    <audioApply value="1.000000" />
    <weight value="20" />
    <type>VMT_ENGINE</type>
  </Item>
  ```

  </details>

  <details>
    <summary>Gearbox Upgrade</summary>

  ```xml
  <Item>
    <identifier />
    <modifier value="25" />
    <audioApply value="1.000000" />
    <weight value="5" />
    <type>VMT_GEARBOX</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="50" />
    <audioApply value="1.000000" />
    <weight value="5" />
    <type>VMT_GEARBOX</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="100" />
    <audioApply value="1.000000" />
    <weight value="5" />
    <type>VMT_GEARBOX</type>
  </Item>
  <Item>
    <identifier />
    <modifier value="150" />
    <audioApply value="1.000000" />
    <weight value="5" />
    <type>VMT_GEARBOX</type>
  </Item>
  ```

  </details>

</details>

---

## Color Theme

---

| Name       | Hex     | Color Preview                               |
| ---------- | ------- | ------------------------------------------- |
| Main       | #4182e2 | ![#4182e2](https://i.imgur.com/qZk8Snx.png) |
| Accent     | #3b4e6c | ![#3b4e6c](https://i.imgur.com/uE8Gdks.png) |
| Background | #2c3b53 | ![#2c3b53](https://i.imgur.com/34ERKoN.png) |
