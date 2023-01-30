class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.content,
    this.price,
    this.images,
    this.options,
    this.sizes,
    this.storeInfo,
    this.returnExchangeInfo,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    price = json['price'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(Sizes.fromJson(v));
      });
    }
    storeInfo = json['store_info'] != null
        ? StoreInfo.fromJson(json['store_info'])
        : null;
    returnExchangeInfo = json['return_exchange_info'];
  }
  int? id;
  String? name;
  String? content;
  int? price;
  List<String>? images;
  List<Options>? options;
  List<Sizes>? sizes;
  StoreInfo? storeInfo;
  String? returnExchangeInfo;
  ProductModel copyWith({
    int? id,
    String? name,
    String? content,
    int? price,
    List<String>? images,
    List<Options>? options,
    List<Sizes>? sizes,
    StoreInfo? storeInfo,
    String? returnExchangeInfo,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        content: content ?? this.content,
        price: price ?? this.price,
        images: images ?? this.images,
        options: options ?? this.options,
        sizes: sizes ?? this.sizes,
        storeInfo: storeInfo ?? this.storeInfo,
        returnExchangeInfo: returnExchangeInfo ?? this.returnExchangeInfo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['content'] = content;
    map['price'] = price;
    map['images'] = images;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      map['sizes'] = sizes?.map((v) => v.toJson()).toList();
    }
    if (storeInfo != null) {
      map['store_info'] = storeInfo?.toJson();
    }
    map['return_exchange_info'] = returnExchangeInfo;
    return map;
  }
}

class StoreInfo {
  StoreInfo({
    this.id,
    this.name,
    this.thumbnailImageUrl,
    this.isFavorite,
  });

  StoreInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    thumbnailImageUrl = json['thumbnail_image_url'];
    isFavorite = json['is_favorite'];
  }
  int? id;
  String? name;
  dynamic thumbnailImageUrl;
  bool? isFavorite;
  StoreInfo copyWith({
    int? id,
    String? name,
    dynamic thumbnailImageUrl,
    bool? isFavorite,
  }) =>
      StoreInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnailImageUrl: thumbnailImageUrl ?? this.thumbnailImageUrl,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['thumbnail_image_url'] = thumbnailImageUrl;
    map['is_favorite'] = isFavorite;
    return map;
  }
}

class Sizes {
  Sizes({
    this.id,
    this.productId,
    this.categoryId,
    this.size,
    this.order,
    this.shoulderCrossLength,
    this.chestCrossLength,
    this.armhole,
    this.armStraightLength,
    this.armCrossLength,
    this.sleeveCrossLength,
    this.bottomCrossLength,
    this.strap,
    this.totalEntryLength,
    this.waistCrossLength,
    this.hipCrossLength,
    this.bottomTopCrossLength,
    this.thighCrossLength,
    this.open,
    this.lining,
    this.entrance_cross_length,
    this.breadth,
    this.diameter,
    this.width,
    this.height,
    this.handle_height,
    this.handle_length,
    this.front_heel_height,
    this.back_heel_height,
    this.calf_cross_length,
    this.weight,
    this.foot_width,
    this.necklace_breadth,
    this.necklace_total_entry_length,
    this.earring_total_entry_length,
    this.clock_diameter,
    this.clock_breadth,
    this.total_length,
    this.total_length2,
    this.entrace_circum,
    this.total_height,
    this.createdAt,
  });

  Sizes.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    size = json['size'];
    order = json['order'];
    shoulderCrossLength = json['shoulder_cross_length'];
    chestCrossLength = json['chest_cross_length'];
    armhole = json['armhole'];
    armStraightLength = json['arm_straight_length'];
    armCrossLength = json['arm_cross_length'];
    sleeveCrossLength = json['sleeve_cross_length'];
    bottomCrossLength = json['bottom_cross_length'];
    strap = json['strap'];
    totalEntryLength = json['total_entry_length'];
    waistCrossLength = json['waist_cross_length'];
    hipCrossLength = json['hip_cross_length'];
    bottomTopCrossLength = json['bottom_top_cross_length'];
    thighCrossLength = json['thigh_cross_length'];
    open = json['open'];
    lining = json['lining'];

    entrance_cross_length = json['entrance_cross_length'];
    breadth = json['breadth'];
    diameter = json['diameter'];
    width = json['width'];
    height = json['height'];
    handle_height = json['handle_height'];
    handle_length = json['handle_length'];
    front_heel_height = json['front_heel_height'];
    back_heel_height = json['back_heel_height'];
    calf_cross_length = json['calf_cross_length'];
    weight = json['weight'];
    foot_width = json['foot_width'];

    necklace_breadth = json['necklace_breadth'];
    necklace_total_entry_length = json['necklace_total_entry_length'];
    earring_total_entry_length = json['earring_total_entry_length'];
    clock_diameter = json['clock_diameter'];
    clock_breadth = json['clock_breadth'];
    total_length = json['total_length'];
    total_length2 = json['total_length2'];
    entrace_circum = json['entrace_circum'];
    total_height = json['total_height'];

    createdAt = json['created_at'];
  }
  int? id;
  int? productId;
  int? categoryId;
  String? size;
  int? order;
  int? shoulderCrossLength;
  dynamic chestCrossLength;
  int? armhole;
  dynamic armStraightLength;
  dynamic armCrossLength;
  dynamic sleeveCrossLength;
  dynamic bottomCrossLength;
  dynamic strap;
  dynamic totalEntryLength;
  dynamic waistCrossLength;
  dynamic hipCrossLength;
  dynamic bottomTopCrossLength;
  dynamic thighCrossLength;
  dynamic open;
  dynamic lining;

  dynamic entrance_cross_length;
  dynamic breadth;
  dynamic diameter;
  dynamic width;
  dynamic height;
  dynamic handle_height;
  dynamic handle_length;
  dynamic front_heel_height;
  dynamic back_heel_height;
  dynamic calf_cross_length;
  dynamic weight;
  dynamic foot_width;

  dynamic necklace_breadth;
  dynamic necklace_total_entry_length;
  dynamic earring_total_entry_length;
  dynamic clock_diameter;
  dynamic clock_breadth;
  dynamic total_length;
  dynamic total_length2;
  dynamic entrace_circum;
  dynamic total_height;

  String? createdAt;
  Sizes copyWith({
    int? id,
    int? productId,
    int? categoryId,
    String? size,
    int? order,
    int? shoulderCrossLength,
    dynamic chestCrossLength,
    int? armhole,
    dynamic armStraightLength,
    dynamic armCrossLength,
    dynamic sleeveCrossLength,
    dynamic bottomCrossLength,
    dynamic strap,
    dynamic totalEntryLength,
    dynamic waistCrossLength,
    dynamic hipCrossLength,
    dynamic bottomTopCrossLength,
    dynamic thighCrossLength,
    dynamic open,
    dynamic lining,
    dynamic entrance_cross_length,
    dynamic breadth,
    dynamic diameter,
    dynamic width,
    dynamic height,
    dynamic handle_height,
    dynamic handle_length,
    dynamic front_heel_height,
    dynamic back_heel_height,
    dynamic calf_cross_length,
    dynamic weight,
    dynamic foot_width,
    dynamic necklace_breadth,
    dynamic necklace_total_entry_length,
    dynamic earring_total_entry_length,
    dynamic clock_diameter,
    dynamic clock_breadth,
    dynamic total_length,
    dynamic total_length2,
    dynamic entrace_circum,
    dynamic total_height,
    String? createdAt,
  }) =>
      Sizes(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        categoryId: categoryId ?? this.categoryId,
        size: size ?? this.size,
        order: order ?? this.order,
        shoulderCrossLength: shoulderCrossLength ?? this.shoulderCrossLength,
        chestCrossLength: chestCrossLength ?? this.chestCrossLength,
        armhole: armhole ?? this.armhole,
        armStraightLength: armStraightLength ?? this.armStraightLength,
        armCrossLength: armCrossLength ?? this.armCrossLength,
        sleeveCrossLength: sleeveCrossLength ?? this.sleeveCrossLength,
        bottomCrossLength: bottomCrossLength ?? this.bottomCrossLength,
        strap: strap ?? this.strap,
        totalEntryLength: totalEntryLength ?? this.totalEntryLength,
        waistCrossLength: waistCrossLength ?? this.waistCrossLength,
        hipCrossLength: hipCrossLength ?? this.hipCrossLength,
        bottomTopCrossLength: bottomTopCrossLength ?? this.bottomTopCrossLength,
        thighCrossLength: thighCrossLength ?? this.thighCrossLength,
        open: open ?? this.open,
        lining: lining ?? this.lining,
        entrance_cross_length:
        entrance_cross_length ?? this.entrance_cross_length,
        breadth: breadth ?? this.breadth,
        diameter: diameter ?? this.diameter,
        width: width ?? this.width,
        height: height ?? this.height,
        handle_height: handle_height ?? this.handle_height,
        handle_length: handle_length ?? this.handle_length,
        front_heel_height: front_heel_height ?? this.front_heel_height,
        back_heel_height: back_heel_height ?? this.back_heel_height,
        calf_cross_length: calf_cross_length ?? this.calf_cross_length,
        weight: weight ?? this.weight,
        foot_width: foot_width ?? this.foot_width,
        necklace_breadth: necklace_breadth ?? this.necklace_breadth,
        necklace_total_entry_length:
        necklace_total_entry_length ?? this.necklace_total_entry_length,
        earring_total_entry_length:
        earring_total_entry_length ?? this.earring_total_entry_length,
        clock_diameter: clock_diameter ?? this.clock_diameter,
        clock_breadth: clock_breadth ?? this.clock_breadth,
        total_length: total_length ?? this.total_length,
        total_length2: total_length2 ?? this.total_length2,
        entrace_circum: entrace_circum ?? this.entrace_circum,
        total_height: total_height ?? this.total_height,
        createdAt: createdAt ?? this.createdAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['category_id'] = categoryId;
    map['size'] = size;
    map['order'] = order;
    map['shoulder_cross_length'] = shoulderCrossLength;
    map['chest_cross_length'] = chestCrossLength;
    map['armhole'] = armhole;
    map['arm_straight_length'] = armStraightLength;
    map['arm_cross_length'] = armCrossLength;
    map['sleeve_cross_length'] = sleeveCrossLength;
    map['bottom_cross_length'] = bottomCrossLength;
    map['strap'] = strap;
    map['total_entry_length'] = totalEntryLength;
    map['waist_cross_length'] = waistCrossLength;
    map['hip_cross_length'] = hipCrossLength;
    map['bottom_top_cross_length'] = bottomTopCrossLength;
    map['thigh_cross_length'] = thighCrossLength;
    map['open'] = open;
    map['lining'] = lining;
    map['created_at'] = createdAt;

    map['entrance_cross_length'] = entrance_cross_length;
    map['breadth'] = breadth;
    map['diameter'] = diameter;
    map['width'] = width;
    map['height'] = height;
    map['handle_height'] = handle_height;
    map['handle_length'] = handle_length;
    map['front_heel_height'] = front_heel_height;
    map['back_heel_height'] = back_heel_height;
    map['calf_cross_length'] = calf_cross_length;
    map['weight'] = weight;
    map['foot_width'] = foot_width;

    map['necklace_breadth'] = necklace_breadth;
    map['necklace_total_entry_length'] = necklace_total_entry_length;
    map['earring_total_entry_length'] = earring_total_entry_length;
    map['clock_diameter'] = clock_diameter;
    map['clock_breadth'] = clock_breadth;
    map['total_length'] = total_length;
    map['total_length2'] = total_length2;
    map['entrace_circum'] = entrace_circum;
    map['total_height'] = total_height;

    return map;
  }
}

class Options {
  Options({
    this.id,
    this.productId,
    this.name,
    this.color,
    this.size,
    this.stockQty,
    this.addPrice,
    this.isSoldOut,
  });

  Options.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    color = json['color'];
    size = json['size'];
    stockQty = json['stock_qty'];
    addPrice = json['add_price'];
    isSoldOut = json['is_sold_out'];
  }
  int? id;
  int? productId;
  String? name;
  String? color;
  String? size;
  int? stockQty;
  int? addPrice;
  String? isSoldOut;
  Options copyWith({
    int? id,
    int? productId,
    String? name,
    String? color,
    String? size,
    int? stockQty,
    int? addPrice,
    String? isSoldOut,
  }) =>
      Options(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        color: color ?? this.color,
        size: size ?? this.size,
        stockQty: stockQty ?? this.stockQty,
        addPrice: addPrice ?? this.addPrice,
        isSoldOut: isSoldOut ?? this.isSoldOut,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['name'] = name;
    map['color'] = color;
    map['size'] = size;
    map['stock_qty'] = stockQty;
    map['add_price'] = addPrice;
    map['is_sold_out'] = isSoldOut;
    return map;
  }
}