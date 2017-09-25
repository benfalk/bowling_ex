defmodule BowlingEx.ScoreCard do
  @pins ~w(1 2 3 4 5 6 7 8 9)

  @doc """
  Your score yo, it caclulates it

  ## Examples

      iex> BowlingEx.ScoreCard.score("xxxxxxxxxxxx")
      300

  """
  def score(""), do: 0
  def score(score) when is_binary(score) do
    do_score(score, 0)
  end

  defp do_score("", total), do: total
  defp do_score(<<"xx", mark::bytes-size(1)>>, total) do
    do_score("", total+20+val_of_mark(mark))
  end
  defp do_score(<<"x", _any::bytes-size(1), "/">>, total) do
    do_score("", total+20)
  end
  defp do_score(<<"x", mark::bytes-size(1), "/", rem::binary>>, total) do
    do_score(mark<>"/"<>rem, total+20)
  end
  defp do_score(<<"x", mark1::bytes-size(1), mark2::bytes-size(1), rem::binary>>, total) do
    do_score(mark1<>mark2<>rem, total+10+val_of_mark(mark1)+val_of_mark(mark2))
  end
  defp do_score(<<_any::bytes-size(1), "/", mark::bytes-size(1), rem::binary>>, total) do
    do_score(mark<>rem, total+10+val_of_mark(mark))
  end
  defp do_score(<<mark1::bytes-size(1), mark2::bytes-size(1), rem::binary>>, total) do
    do_score(rem, total+val_of_mark(mark1)+val_of_mark(mark2))
  end
  defp do_score(_anything, total), do: total

  defp val_of_mark(mark) do
    case mark do
      "-" ->
        0

      num when num in @pins ->
        String.to_integer(num)

      "x" ->
        10
    end
  end
end
