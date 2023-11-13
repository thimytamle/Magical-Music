use_bpm 80

in_thread do
  live_loop :drum do
    sample :drum_bass_soft
    sleep 0.5
    sample :drum_cymbal_closed
    sleep 0.5
    
    with_fx :reverb do
      sample :drum_snare_soft
      sleep 0.5
    end
    
    sample :drum_cymbal_closed
    sleep 0.5
    
  end
end

in_thread do
  use_synth :saw
  with_fx :reverb do
    loop do
      
      play choose(scale(:D3, :major_pentatonic, num_octaves: 3)), release: 0.5, amp: 0.5
      
      sleep 0.25
      
    end
  end
  
  use_synth :saw
  loop do
    4.times do
      play :D2, release: 4, amp: 0.25
      sleep 2
    end
    
    2.times do
      play :A2, release: 4, amp: 0.25
      sleep 2
    end
    
    2.times do
      play :G2, release: 2, amp: 0.25
      sleep 2
    end
  end
  
  with_fx :reverb do
    with_fx :echo do
      loop do
        
        2.times do
          play chord(:D3, :M7)
          sleep 4
        end
        1.times do
          play chord(:D3, :M7)
          sleep 4
        end
        1.times do
          play chord(:D3, :M7)
          sleep 4
        end
      end
    end
  end
end
