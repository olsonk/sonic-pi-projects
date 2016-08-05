use_bpm 85

arp = (ring :c3, :e3, :g3, :b3, :c4, :b3, :g3, :e3)
live_loop :arp, delay: 4 do
  use_synth :supersaw
  play arp.tick, cutoff: (line 40, 120, steps: 100).reflect.look, sustain: 0.05
  sleep 0.25
end

with_fx :compressor do
  live_loop :dark, delay: 4 do
    use_synth :tb303
    use_synth_defaults res: 0.9, cutoff: rrand(80, 95), amp: 0.8
    play :c2, sustain: 3
    play :c3, sustain: 3
    sleep 6
    play :d2, sustain: 1.5
    play :d3, sustain: 1.5
    sleep 2
    play :e2, sustain: 4
    play :e3, sustain: 4
    sleep 8
  end
end

live_loop :heart do
  sample :drum_bass_hard, cutoff: 110
  sleep 0.25
  sample :drum_bass_hard, cutoff: 110
  sleep 0.75
end

with_fx :echo, decay: 8 do
  with_fx :flanger, phase: 2 do
    live_loop :amb, delay: 4 do
      if one_in 4
        sample :ambi_lunar_land, rate: rrand(-1, 1)
      else
        if one_in 2
          sample :ambi_glass_hum, beat_stretch: rrand(3, 5)
        end
      end
      sample :ambi_soft_buzz, beat_stretch: 3, amp: 2
      sleep 8
    end
  end
end