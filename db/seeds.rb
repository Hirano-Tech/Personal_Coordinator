[
  [555, 'ビックロ 新宿東口店', '東京都新宿区新宿三丁目29番1号 ビックロ 7F', 'kEfbNo2yhWhTXUUn9', '03-5369-0371'],
  [4901, 'GU STYLE STUDIO 原宿', '東京都渋谷区神宮前一丁目13番14号 原宿クエスト 2F', '5eUH5PaYPRvyqzcbA', '03-5843-0065']
].each do |id, name, address, google_map, phone|
  GuStore.create({id: id, name: name, address: address, google_map: google_map, phone: phone})
end

[
  ['Chihiro', '女性', 160, '09b187c8442e998f14747a2aaa9a8c30', 555],
  ['Kazuki' , '男性', 172, '2dddc13c36d91bf7ed4b65e6f707b182', 555],

  ['Hinako' , '女性', 153, '6c4a315424b2001d6ebdaa563f92dc81', 4901],
  ['Saki'   , '女性', 153, '6449e8bb11916d4152b1885b0d5b96b3', 4901],
  ['Haruka' , '女性', 154, 'fef5829b754726ab6c195f88563d6448', 4901],
  ['karen'  , '女性', 154, '4f92ae6c725822211532bf11e56b4133', 4901],
  ['Miku'   , '女性', 155, 'a41003f626963262c02f51b85a067bac', 4901],
  ['Maika'  , '女性', 157, 'bc68361249a2448b273dfe932ac53b6f', 4901],
  ['Nana'   , '女性', 158, '5f2b642fe05e1add465b8106c40549e6', 4901],
  ['Nanami' , '女性', 158, '07cddfea451c221ff9991bdf4121eeeb', 4901],
  ['Nodoka' , '女性', 160, '401d739f313fcba08975b10e3d6196d9', 4901],
  ['Kenjiro', '男性', 175, 'b6c6ad270520cf66443741f6e76b3955', 4901],
  ['Koki'   , '男性', 175, '01ffb6630ffc940b5e2c3f3fb5a1540a', 4901],
  ['Shotaro', '男性', 178, '8062fd2cfaea4af8ee81016a30de22af', 4901]
].each do |name, gender, height, staff_id, gu_store_id|
  GuOsyaristum.create({name: name, gender: gender, height: height, staff_id: staff_id, gu_store_id: gu_store_id})
end
