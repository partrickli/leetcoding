
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	var d = [Int: Int]()
	for i in 0..<nums.count {
		if let j = d[nums[i]] {
			return [i, j]
		} else {
			d[target - nums[i]] = i
		}
	}
	return [-1, -1]
}
