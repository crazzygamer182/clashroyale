-- Clash Royale Imposter Game Database Schema
-- Copy and paste this into your Supabase SQL Editor

-- Create rooms table
CREATE TABLE IF NOT EXISTS rooms (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  join_code TEXT UNIQUE NOT NULL,
  host_id UUID,
  status TEXT DEFAULT 'waiting', -- waiting, started, ended
  selected_card TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create players table
CREATE TABLE IF NOT EXISTS players (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  room_id UUID REFERENCES rooms(id) ON DELETE CASCADE,
  player_name TEXT NOT NULL,
  is_host BOOLEAN DEFAULT FALSE,
  is_imposter BOOLEAN DEFAULT FALSE,
  joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE players ENABLE ROW LEVEL SECURITY;

-- RLS Policies for rooms (allow all operations for simplicity)
CREATE POLICY "Enable read access for all users" ON rooms
  FOR SELECT USING (true);

CREATE POLICY "Enable insert access for all users" ON rooms
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Enable update access for all users" ON rooms
  FOR UPDATE USING (true);

CREATE POLICY "Enable delete access for all users" ON rooms
  FOR DELETE USING (true);

-- RLS Policies for players (allow all operations for simplicity)
CREATE POLICY "Enable read access for all users" ON players
  FOR SELECT USING (true);

CREATE POLICY "Enable insert access for all users" ON players
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Enable update access for all users" ON players
  FOR UPDATE USING (true);

CREATE POLICY "Enable delete access for all users" ON players
  FOR DELETE USING (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_rooms_join_code ON rooms(join_code);
CREATE INDEX IF NOT EXISTS idx_players_room_id ON players(room_id);

-- Enable realtime for both tables
ALTER PUBLICATION supabase_realtime ADD TABLE rooms;
ALTER PUBLICATION supabase_realtime ADD TABLE players;
