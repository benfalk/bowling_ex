defmodule BowlingEx.ScoreCardTest do
  use ExUnit.Case
  doctest BowlingEx.ScoreCard

  alias BowlingEx.ScoreCard

  test "an empty string is zero... I hope" do
    assert ScoreCard.score("") == 0
  end

  test "two gutters is also zero" do
    assert ScoreCard.score("--") == 0
  end

  test "2 and and 4 are six" do
    assert ScoreCard.score("24") == 6
  end

  test "2, 4, 2 should also be a six" do
    assert ScoreCard.score("242") == 6
  end

  test "2, 3, 5, 4 should be 14" do
    assert ScoreCard.score("2354") == 14
  end

  test "a single strike with no more marks should be zero" do
    assert ScoreCard.score("x") == 0
  end

  test "a strike followed two more marks should add up" do
    assert ScoreCard.score("x42") == 22
  end

  test "a spare works correctly" do
    assert ScoreCard.score("-/4-") == 18
  end

  test "x4/4" do
    assert ScoreCard.score("x4/4") == 34
  end

  test "x4/4-" do
    assert ScoreCard.score("x4/4-") == 38
  end

  test "xxxxxxxxxxxx is 300" do
    assert ScoreCard.score("xxxxxxxxxxxx") == 300
  end

  test "xxxxxxxxxxx9 is 299" do
    assert ScoreCard.score("xxxxxxxxxxx9") == 299
  end

  test "xxxxxxxxx2/6 is 268" do
    assert ScoreCard.score("xxxxxxxxx2/6") == 268
  end

  test "xxxxxxxxxx9/ is 289" do
    assert ScoreCard.score("xxxxxxxxxx9/") == 289
  end

  test "x9/" do
    assert ScoreCard.score("x9/") == 20
  end
end
