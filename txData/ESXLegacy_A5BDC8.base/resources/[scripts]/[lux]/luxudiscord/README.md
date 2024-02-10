# Discord Bot for Managing your FiveM Server

This bot integreates with LuxuAdmin and aims to provide remote administrative features.

This will allow you do control and manage your fivem server from your discord, without the need to join your server.

## Installation

3. Open server.lua and add the following lines

```lua

add_ace resource.luxudiscord command allow

```

## Commands

Here's a list of the available commands:

`/playerlist`

- Returns a list of all online players

`/playerinfo id`

- Returns full information about the specified player

`/kick id`

- Kick player

`/ban id duration`

- Bans a player for a duration of time

`/ban-permanent id`

- Bans a player permanently

`/kill id`

- Kill the player ped

`/setjob id name grade`

- Changes a player's job
  - id: `player id`
  - name: `job name`
  - grade: `job grade`

`/screenshot [id] - g`

---

### **Reports 📩**

`/report-list`

- Shows a list of active reports (LuxuAdmin)

`/report-reply reportID message`

- Sends a reply to the specified report

---

### **Teleportation**

`/tp id x y z`

- Teleports a player to the given coords

`/tp-vector3 id vector3`

- Teleports the player to the given coords using format: `vector3(x,y,z)`
- Example: `/tp 3 vector3(4243.33,22.02,-12.02)`

`/tptoplayer player1 player2`

- Teleports player 1 to player 2
  - player1: `player server id`
  - player2: `player server id`

---

### **Notifications**

`/notify id message type duration`

- Notifies a player
  - id: `player server id`
  - message: `message content`
  - type: `success` | `warning` | `error` | `info`
  - duration: `seconds`

`/notify-all message type duration`

- Notifies all players in the FiveM server
  - message: `message content`
  - type: `success` | `warning` | `error` | `info`
  - duration: `seconds`

`/notify-all-discord channel message type duration`

- Notifies all players in the FiveM server and sends a message to the given discord channel
  - channel: `discord channel`
  - message: `message content`
  - type: `success` | `warning` | `error` | `info`
  - duration: `seconds`

---

**Items | Cars | Money | Crypto**

`/give id item amount`

- Gives items to player

`/spawnvehicle id car_model`

- Spawns a car for the player

`/give-vehicle id car_model`

- Gives car to player

`/setcrypto id crypto-id type amount`

- Sets player crypto (LuxuCEX)
  - id: `player server id`
  - crypto-id: `coin id`
  - type: `set` | `add` | `remove`
  - amount: `number`

`/setmoney id account amount`

- Updates a player's money account
  - id: `player server id`
  - account: `bank` | `money` - Type of account (you configure this in config.lua)
  - amount: `number`

---

**Weather ☀️ And Time 🕰️**

`/time hours minutes`

- Changes server time

`/weather type`

- Changes server weather
  - type: `SUNNY` | `EXTRASUNNY` | todo...

`/weather-freeze`

- ***

  **Inventory Managment**

`/inventory-list id`

- Returns a list of items in a player's inventory

`/inventory-remove id item amount`

- Removes item from player inventory

---

**Resource Management**

/resource ensure [resource] - god

/resource inspect [resource] - god

/resource list - god

/resource refresh - god

/resource start [resource] - god

/resource stop [resource] - god
