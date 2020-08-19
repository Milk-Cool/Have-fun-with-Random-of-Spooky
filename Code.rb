# Have fun with Random of Spooky
# By Milk_Cool
define :loop1 do
  4.times do
    play 75, release: 0.25
    sleep 0.25
    play 80, release: 0.25
    sleep 0.25
    play 85, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 85, release: 0.25
    sleep 0.25
    play 80, release: 0.25
    sleep 0.25
    play 75, release: 0.25
    sleep 0.25
  end
  4.times do
    play 85, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 95, release: 0.25
    sleep 0.25
    play 100, release: 0.25
    sleep 0.25
    play 100, release: 0.25
    sleep 0.25
    play 95, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 85, release: 0.25
    sleep 0.25
  end
end
define :loop2 do
  in_thread do
    sleep 8
    with_synth :noise do
      play 60, attack: 8, release: 0, amp: 0.5
    end
  end
  8.times do
    play 75, release: 0.25
    sleep 0.25
    play 80, release: 0.25
    sleep 0.25
    play 85, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 90, release: 0.25
    sleep 0.25
    play 85, release: 0.25
    sleep 0.25
    play 80, release: 0.25
    sleep 0.25
    play 75, release: 0.25
    sleep 0.25
  end
end
use_synth :piano
loop1
use_synth :blade
loop1
in_thread do
  use_synth :hollow
  loop2
end
use_synth :hoover
loop2
in_thread do
  with_fx :echo, phase: 0.5 do
    sample :elec_beep, amp: 2.0, rate: 0.75
    sleep 2
    sample :elec_beep, amp: 2.0, rate: 0.85
    sleep 2
    sample :elec_beep, amp: 2.0, rate: 0.75
    sleep 2
    sample :elec_beep, amp: 2.0, rate: 0.65
  end
end
use_synth :bnoise
play 60, sustain: 5.5, release: 2.5, amp: 1.5
sleep 6
sample :ambi_glass_rub, amp: 2.0
sleep sample_duration :ambi_glass_rub
sample :ambi_glass_rub, amp: 0.75, rate: 0.5
sleep (sample_duration :ambi_glass_rub) * 2
effects = true
in_thread do
  use_synth :cnoise
  loop do
    if effects
      play 60, sustain: 0.5, release: 0, amp: 0.25
      sleep 0.5
    else
      break
    end
  end
end
use_synth :dtri
in_thread do
  sleep 20.6
  sample :misc_crow, amp: 1.5
  use_synth :tb303
  loop do
    if effects
      play 80, amp: 0.2
      sleep 0.25
      play 95, amp: 0.2
      sleep 0.25
    else
      break
    end
  end
end
2.times do
  play 60, release: 2, amp: 1.5, pan: 0.7
  sleep 3
  play 65, release: 2, amp: 1.5, pan: -0.7
  sleep 2
  play 62, release: 1, amp: 1.5, pan: 0.3
  sleep 0.3
  play 63.5, release: 2, amp: 1.5, pan: -0.3
  sleep 5
  play 60, release: 2, amp: 1.5, pan: 0.7
  sleep 3
  play 65, release: 2, amp: 1.5, pan: -0.7
  sleep 2
  play 68, release: 0.75, amp: 1.5, pan: -0.3
  sleep 0.3
  play 60, release: 2, amp: 1.5, pan: 0.3
  sleep 5
end
effects = false
sample :misc_crow, amp: 1.5
