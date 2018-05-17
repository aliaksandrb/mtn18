#!/usr/bin/env ruby
# develop by Aliaksandr Chernak

def task_3_1(pro, start = Time.now)
  pro.call
  (Time.now - start).round(1)
end

def task_3_2(arr, add = 0)
  arr = arr.map { |f| yield(f) } if block_given?
  arr.inject(0, &:+) + add
end

def task_3_3(r)
  r.find { |f| f > 99 && f < 1000 && f % 7 == 3 }
end

def task_3_4(_myo, _myt, *mya)
  block_given? ? mya.map { |v| yield(v) } : 'ERROR'
end

def task_3_5(arr, a = [])
  arr.each do |f|
    if yield(f)
      a << f if f.even?
    end
  end
  a
end

def task_3_6(stg, d = [])
  block_given? ? stg.each_line { |f| d << yield(f) } : d = stg
  d
end
