defmodule CLITest do
  use ExUnit.Case
  doctest Issues
  import Issues.CLI, only: [ parse_args: 1 ]

  test "help returned by passing -h or --help options" do
    assert parse_args([ "-h", "anything" ]) == :help
    assert parse_args([ "--help", "anything" ]) == :help
  end

  test "three values returned if three given" do
    assert parse_args([ "user", "project", "5" ]) == { "user", "project", 5 }
  end

  test "count is defaulted whe two values are given" do
    assert parse_args([ "user", "project" ]) == { "user", "project", 4 }
  end
end
