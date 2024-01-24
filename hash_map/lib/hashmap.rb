class HashMap
  attr_reader :length

  def initialize(size = 16)
    @buckets = Array.new(size) { [] }
    @length = 0
  end

  def []=(key, value)
    set(key, value)
  end

  def string_to_number(string)
    hashCode = 0
    primeNumber = 31

    string.each_char { |char| hashCode = primeNumber * hashCode + char.ord }

    hashCode % @buckets.size
  end

  def hash(text)
    string_to_number(text)
  end

  def set(key, value)
    bucket = @buckets[hash(key)]
    itemArray = bucket.find { |item| item[0] == key }
    if itemArray
      itemArray[1] = value
    else
      bucket << [key, value]
      @length += 1
      resize
    end
  end

  def get(key)
    bucket = @buckets[hash(key)]
    bucket = bucket.find { |item| item[0] == key }
    return bucket[1] if bucket

    'No Item'
  end

  def key?(key)
    bucket = @buckets[hash(key)][0]
    return true if !bucket.nil? && bucket[0] == key

    false
  end

  def remove(key)
    bucket = @buckets[hash(key)][0]
    bucket.reject! { |item| item[0] == key }
    @length -= 1
  end

  def clear
    @buckets.map! { [] }
  end

  def getItems
    container = []
    @buckets.each do |bucket|
      next if bucket.empty?

      bucket.each do |item|
        container << yield(item)
      end
    end
    container
  end

  def keys
    getItems { |item| item[0] }
  end

  def values
    getItems { |item| item[1] }
  end

  def entries
    getItems { |item| item }
  end

  def load_factor
    @length.to_f / @buckets.size
  end

  def resize
    return unless load_factor > 0.8

    newBuckets = Array.new(@buckets.size * 2) { [] }

    entries.each do |key, value|
      newBuckets[hash(key)] << [key, value]
    end
  end
end
