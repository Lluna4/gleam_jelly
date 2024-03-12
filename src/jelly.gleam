import gleam/io
import gleam/json
import youid/uuid
import glisten
import glisten/tcp
import glisten/socket/options.{ActiveMode, Passive}
import gleam/result
import gleam/erlang/process
import gleam/option.{None}
import gleam/otp/actor

pub type User {
  Sock
  Uname
  UUID
}

pub fn main() {
  let assert Ok(_) = glisten.handler(conn, manage)
  |> glisten.serve(25566)
  process.sleep_forever()
}

fn conn() {
  io.println("started")

  #(Nil, None)
}

fn manage(msg, state, conn) 
{
  io.println("msg recv")
  io.debug(msg)
  actor.continue(state)
}
