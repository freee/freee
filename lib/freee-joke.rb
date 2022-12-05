require 'curses'

class FreeeJoke
  include Curses

  TSUBAME = [
    %q|                                         |,
    %q|                                 "f-     |,
    %q|                             `,>8B6-     |,
    %q|                           `+GRBBH^      |,
    %q|                        `_?OBBBB&;       |,
    %q|                      .+pRBBBBB$"        |,
    %q|                    +5HBBBBBBBh:         |,
    %q|                 "igBBBBBBBBD+`          |,
    %q|               +&BBBBBBBBBH<             |,
    %q|            "JMBBBBBBBBB&+               |,
    %q|    `~vYYYYOBBBBBBBBBgt"                 |,
    %q| ,_Y&BMY!SBBBBBBBBBE>,,,,-........-,,,,. |,
    %q|`!!!]EObAwEEEEEEEEEEE$HRBR888888888KE{!, |,
    %q|      .>p61'         `'~^;;!YD&i";'      |,
    %q|        'CRHGv!;.     `_!>%0BBMbbbbo{+   |,
    %q|         `+$BBBRMgggAALJJ"''''''''''''   |,
    %q|           'uRBBBBBBR!                   |,
    %q|             !8BBBBBBR*                  |,
    %q|               tQBBBBBRY                 |,
    %q|                ^EBBBBBRJ                |,
    %q|                  1RBBBBg!               |,
    %q|                   ~9BBBBZ               |,
    %q|                     +QBBZ               |,
    %q|                      ,SB8"              |,
    %q|                        _u!              |,
    %q|                                         |
  ]

  def run
    Signal.trap(:INT, nil)
    curses_screen {|screen|
      curs_set(0)
      #screen.nodelay(true)
      #screen.leaveok(true)
      screen.scrollok(false)

      v_dir = [1, -1].sample # initial vertical direction is random
      v_off = rand(lines - TSUBAME.size) # initial vertical offset is random
      (1...(cols + TSUBAME[0].size)).each {|c|
        (0...TSUBAME.size).reverse_each {|l|
          if c < cols
            setpos(l + v_off, cols - c)
            addstr(TSUBAME[l][0...c])
          else
            setpos(l + v_off, 0)
            addstr(TSUBAME[l][(c - cols)...cols])
          end
        }
        refresh
        sleep(0.01);
        next if c % 10 != 0
        v_off += v_dir
        if TSUBAME.size + v_off >= lines
          v_dir = -1
        elsif v_off <= 0
          v_dir = +1
        end
      }
    }
  end

private
  def curses_screen
    screen = init_screen
    begin
      yield screen
    ensure
      flushinp
      close_screen
    end
  end
end
