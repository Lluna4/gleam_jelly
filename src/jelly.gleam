import gleam/io
import gleam/json
import youid/uuid
import glisten.{Packet}
import glisten/tcp
import glisten/socket/options.{ActiveMode, Passive}
import gleam/result
import gleam/erlang/process
import gleam/option.{None}
import gleam/otp/actor
import gleam/bit_array
import gleam/string

pub type User {
  Sock
  Uname
  UUID
}

pub fn main() {
  let assert Ok(_) = glisten.handler(conn, manage)
  |> glisten.serve(25565)
  process.sleep_forever()
}

fn conn() {
  io.println("started")

  #(Nil, None)
}

fn manage(msg, state, conn) 
{
  io.println("msg recv")
  let assert Packet(msg) = msg
  let last = bit_array.inspect(msg)
  let last = string.drop_right(from: last, up_to: 2)
  let res = case string.ends_with(last, "1")
  {
    True -> "Status"
    False -> "Login"
  }
  io.debug(res)
  io.debug(last)
  actor.continue(state)
}
