# كيف تزيد أسئلة ولاعبين

1. إضافة سؤال في lib/data/questions_data.dart
يجب ذكر source و date لكل سؤال - لا تختلق نتائج.

2. إضافة لاعب: ضع صورة مرخصة في assets/images/players/ ثم زيد في initialPlayers

3. إضافة مباراة: في initialMatches مع مصدر FTF أو CAF

4. Supabase: جدول questions مع is_approved
