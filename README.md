# Clash Royale Imposter Game

A multiplayer web game where players try to find the imposter among them. Everyone sees the same Clash Royale card except one random player who is the imposter!

## Setup Instructions

### 1. Set Up Supabase

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project
3. Wait for the project to finish setting up
4. Go to the SQL Editor in your Supabase dashboard
5. Copy the entire contents of `supabase-schema.sql` and paste it into the SQL Editor
6. Click "Run" to execute the SQL and create your database tables

### 2. Get Your Supabase Credentials

1. In your Supabase project, go to Settings > API
2. Copy your "Project URL" (it looks like `https://xxxxx.supabase.co`)
3. Copy your "anon public" API key

### 3. Configure the Game

1. Open `index.html` in a text editor
2. Find these lines near the top of the `<script>` section:
   ```javascript
   const SUPABASE_URL = 'YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
   ```
3. Replace `YOUR_SUPABASE_URL` with your Project URL
4. Replace `YOUR_SUPABASE_ANON_KEY` with your anon public key
5. Save the file

### 4. Run the Game

Simply open `index.html` in your web browser. You can:
- Host it on any static hosting service (Netlify, Vercel, GitHub Pages, etc.)
- Or just open the file directly in your browser for local testing

## How to Play

1. **Host creates a room**: One player enters their name and clicks "Create Room"
2. **Players join**: Other players click "Join Room" and enter the join code shown on the host's screen
3. **Wait for players**: The lobby shows all connected players. You need at least 3 players to start
4. **Host starts the game**: When ready, the host clicks "Start Game"
5. **Find the imposter**: Everyone sees the same Clash Royale card EXCEPT the imposter who sees nothing. Discuss and figure out who the imposter is!

## Game Rules

- Minimum 3 players required to start
- One player is randomly selected as the imposter
- The imposter doesn't see any card
- All other players see the same randomly selected Clash Royale card
- Players must discuss and figure out who the imposter is

## Technical Details

- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Backend**: Supabase (PostgreSQL + Realtime)
- **Real-time updates**: Players see lobby updates in real-time using Supabase subscriptions
- **No server needed**: Fully serverless architecture

## Files

- `index.html` - Main game file (frontend)
- `supabase-schema.sql` - Database schema for Supabase
- `README.md` - This file

## Troubleshooting

**Players not seeing updates**: Make sure you enabled Realtime in Supabase by running the SQL script which includes:
```sql
ALTER PUBLICATION supabase_realtime ADD TABLE rooms;
ALTER PUBLICATION supabase_realtime ADD TABLE players;
```

**Can't join room**: Check that the join code is correct and the game hasn't started yet

**Need at least 3 players**: The game requires a minimum of 3 players to start

## Customization

You can customize the Clash Royale cards by editing the `clashRoyaleCards` array in `index.html`:
```javascript
const clashRoyaleCards = [
    'Knight', 'Archers', 'Giant', // ... add more cards
];
```

Enjoy the game!
