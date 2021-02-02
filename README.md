# Getting started

## Installation

- bundle install
- rails db:create
- rails s

## Configuration

create a .env file at the root of the projets :

`touch .env`

Got to https://www.warcraftlogs.com/ and configure your credentials, then add the two following keys to your .env file :

- WARCRAFT_LOGS_CLIENT_KEY=yourkey
- WARCRAFT_LOGS_CLIENT_NAME=yourclientname

# TODO

- support for Spell element dammages
- support for Spell element resist
- support for enchantments
- support for sets bonuses
- support for races base stats
- support racials bonuses
