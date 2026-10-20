
import 'package:supabase_flutter/supabase_flutter.dart';
class SupabaseService {
  static bool _initialized=false;
  static Future<void> init({String? url,String? anonKey}) async {
    if(_initialized) return;
    if(url==null||anonKey==null) return;
    await Supabase.initialize(url:url,anonKey:anonKey);
    _initialized=true;
  }
  static SupabaseClient? get client=> _initialized? Supabase.instance.client:null;
}
