// ignore_for_file: unused_import

import 'item.list.model.dart';

class Item {
	List<Item>? items;

	Item({this.items});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'items': items?.map((e) => e.toJson()).toList(),
			};
}
