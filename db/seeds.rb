[
  [135, '心斎橋店', '大阪府大阪市中央区心斎橋筋二丁目1番17号', 'jqZQqVff1aDecx2K6', '06-6484-3304'],
  [138, 'イオンモール新居浜店', '愛媛県新居浜市前田町八丁目8番地 イオンモール新居浜 2F', 'Xtai5NwKdsjfeTv39', '0897-31-0155'],
  [439, 'ヨドバシ博多店', '福岡県福岡市博多区博多駅中央街六丁目12番地 ヨドバシ博多 3F', '5vgzv8YaZwhD124d7', '092-433-2722'],
  [444, 'パワーモール前橋みなみ店', '群馬県前橋市新堀町952番地', '2YiNXoo3VxTa49y48', '027-210-0435'],
  [1239, '富士店', '静岡県富士市津田162番地', 'FTwCNfvkNbghE9e97', '0545-30-6056']
].each do |id, name, address, google_map, phone|
  GuStore.create({id: id, name: name, address: address, google_map: google_map, phone: phone})
end

[
  ['kozue' , '女性', 150, true, 'gu_staff_kozue' , 'a3852599700d6ddce64d8a845ee8e729', 1239],
  ['Ryoko' , '女性', 157, true, 'gu_staff_ryoko' , '110d0136606abcd2fe3ed270ef3802f8', 135],
  ['Moena', '女性', 165, true, 'gu_staff_moena', '31f2bd7bd00f450491b9e9ea309a185c', 444],
  ['Satomi', '女性', 165, true, 'gu_staff_satomi', 'ce22f6d46f1dad725beece0b2e0bea64', 439],
  ['Kai', '男性', 176, true, 'gu_staff_kai', 'e166b68d21bdcc8a96ea9d57abe07bc0', 138]
].each do |name, gender, height, official, instagram_id, staff_id, gu_store_id|
  GuOsyaristum.create({name: name, gender: gender, height: height, official: official, instagram_id: instagram_id, staff_id: staff_id, gu_store_id: gu_store_id})
end

[
  ['Kanna', '女性', 156, '832f6a7292033684b409ccd8b73cd9b7', 135],
  ['Rena' , '女性', 159, 'acd2f8daf1663aa5be31a2e8eb839388', 135],
  ['Keika', '女性', 160, '45863f998bb1896b70c4bf1c8f3f0310', 135],
  ['ayaka', '女性', 169, 'b19eaf42ed15d2c61fc5bc33683ad8c6', 135],
  ['naoki', '男性', 167, '8a92a98e2a2ec8c66532a705095f39e6', 135],
  ['Ryoto', '男性', 173, 'ccda3a800db3af69e5365a161afdb91a', 135],

  ['NAO', '女性', 164, '787dbe12b067da824a51bc5b205b0040', 138],

  ['Moe', '女性', 165, 'cf902501e0e767760567fab5a491680f', 439],

  ['Mai', '女性', 165, '841d692b5903d89278e66c6e94f1903b', 444],

  ['Chihiro', '女性', 160, '09b187c8442e998f14747a2aaa9a8c30', 555],
  ['Kazuki' , '男性', 172, '2dddc13c36d91bf7ed4b65e6f707b182', 555],

  ['akane'  , '女性', 152, '6075a86322fac0f5707cfe2f531a6ab9', 1239],
  ['Kazumi' , '女性', 163, 'a7ef3e2dd5e5122f992757c1e0a348d6', 1239],
  ['Yoshimi', '女性', 163, '9d421cbe3448f84e9094c152181b9596', 1239],

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
