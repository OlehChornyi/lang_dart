void main(List<String> args) {
  final factory = GlyphFactory();

  final glyphA1 = factory.getGlyph('A');
  final glyphA2 = factory.getGlyph('A');
  final glyphB = factory.getGlyph('B');

  print(identical(glyphA1, glyphA2));

  glyphA1.render('Arial');
  glyphB.render('Times New Roman');
  //--------------------
  final factory1 = TreeFactory();
  final trees = <Tree>[];

  trees.add(Tree(1, 2, factory1.getTreeType('Oak', 'Green')));
  trees.add(Tree(2, 3, factory1.getTreeType('Pine', 'DarkGreen')));
  trees.add(Tree(3, 4, factory1.getTreeType('Oak', 'Green'))); // Shared

  for (var tree in trees) {
    tree.draw();
  }
  //--------------------
  final factory2 = BulletFactory();

  final bullet1 = factory2.getBulletType('Circle', 10);
  final bullet2 = factory2.getBulletType('Circle', 10);
  final bullet3 = factory2.getBulletType('Triangle', 15);

  bullet1.draw('Red', 10, 20);
  bullet2.draw('Blue', 15, 30);
  bullet3.draw('Yellow', 25, 40);

  print(identical(bullet1, bullet2));
  //--------------------
  final factory4 = CardFactory();

  final aceSpades1 = factory4.getCard('A', 'Spades');
  final aceSpades2 = factory4.getCard('A', 'Spades');
  final kingHearts = factory4.getCard('K', 'Hearts');

  aceSpades1.show();
  aceSpades2.show();
  kingHearts.show();

  print(identical(aceSpades1, aceSpades2)); 
  //--------------------
  final emojiFactory = EmojiFactory();

  final smile1 = emojiFactory.getEmoji('😊');
  final smile2 = emojiFactory.getEmoji('😊');
  final heart = emojiFactory.getEmoji('❤️');

  smile1.render('Alice');
  heart.render('Bob');
  smile2.render('Charlie');

  print(identical(smile1, smile2)); 
}

//The Flyweight pattern is used to reduce memory usage by sharing
//common parts of objects instead of duplicating them.
//It separates intrinsic (shared) and extrinsic (unique) state.

//16.1. Character Glyphs in a Text Editor
//Share glyphs (characters) used in a text editor to avoid duplication.
class Glyph {
  final String character;

  Glyph(this.character);

  void render(String font) {
    print('Rendering "$character" in font $font');
  }
}

class GlyphFactory {
  final Map<String, Glyph> _glyphs = {};

  Glyph getGlyph(String char) {
    return _glyphs.putIfAbsent(char, () => Glyph(char));
  }
}

//16.2. Tree Rendering in a Forest
//Share tree types in a forest to optimize memory usage.
class TreeType {
  final String name;
  final String color;

  TreeType(this.name, this.color);

  void draw(int x, int y) {
    print("Drawing $name tree with color $color at ($x, $y)");
  }
}

class TreeFactory {
  final Map<String, TreeType> _types = {};

  TreeType getTreeType(String name, String color) {
    final key = '$name-$color';
    return _types.putIfAbsent(key, () => TreeType(name, color));
  }
}

class Tree {
  final int x, y;
  final TreeType type;

  Tree(this.x, this.y, this.type);

  void draw() => type.draw(x, y);
}

//16.3. Bullet Rendering in a Game
//Share bullet types with different damage models and reuse them.
class BulletType {
  final String shape;
  final int damage;

  BulletType(this.shape, this.damage);

  void draw(String color, int x, int y) {
    print('Drawing $shape bullet at ($x,$y) with color $color and damage $damage');
  }
}

class BulletFactory {
  final Map<String, BulletType> _types = {};

  BulletType getBulletType(String shape, int damage) {
    final key = '$shape-$damage';
    return _types.putIfAbsent(key, () => BulletType(shape, damage));
  }
}

//16.4. Playing Card Flyweight
//Use flyweight to share playing card types 
//(suit + rank) between multiple decks.
class Card {
  final String suit;
  final String rank;

  Card(this.suit, this.rank);

  void show() => print("Card: $rank of $suit");
}

class CardFactory {
  final Map<String, Card> _cards = {};

  Card getCard(String rank, String suit) {
    final key = '$rank-$suit';
    return _cards.putIfAbsent(key, () => Card(suit, rank));
  }
}

//16.5. Emoji Icon Sharing
//Use flyweight to optimize emoji rendering in a chat application.
class Emoji {
  final String code;

  Emoji(this.code);

  void render(String username) {
    print('$username used emoji: $code');
  }
}

class EmojiFactory {
  final Map<String, Emoji> _cache = {};

  Emoji getEmoji(String code) {
    return _cache.putIfAbsent(code, () => Emoji(code));
  }
}