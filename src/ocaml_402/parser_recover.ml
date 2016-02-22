open Parser_raw

module Default = struct

  open Asttypes

  let default_expr = Fake.any_val'
  let default_type = Ast_helper.Typ.any ()
  let default_pattern = Ast_helper.Pat.any ()
  let default_longident = Longident.Lident "_"
  let default_longident_loc = Location.mknoloc (Longident.Lident "_")

  let default_payload = Parsetree.PStr []
  let default_attribute = Location.mknoloc "", default_payload

  let default_module_expr = Ast_helper.Mod.structure []
  let default_module_type = Ast_helper.Mty.signature []
  let default_module_decl = Ast_helper.Md.mk (Location.mknoloc "_") default_module_type
  let default_module_bind = Ast_helper.Mb.mk (Location.mknoloc "_") default_module_expr
  let default_value_bind = Ast_helper.Vb.mk default_pattern default_expr

  let value (type a) : a MenhirInterpreter.symbol -> a = function
    | MenhirInterpreter.T MenhirInterpreter.T_error -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_WITH -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_WHILE_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_WHILE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_WHEN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_VIRTUAL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_VAL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_UNDERSCORE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_UIDENT -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_TYPE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_TRY_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_TRY -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_TRUE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_TO -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_TILDE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_THEN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_STRUCT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_STRING -> ("", None)
    | MenhirInterpreter.T MenhirInterpreter.T_STAR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_SIG -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_SHARPSHARP -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_SHARPOP -> ""
    | MenhirInterpreter.T MenhirInterpreter.T_SHARP -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_SEMISEMI -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_SEMI -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_RPAREN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_REC -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_RBRACKET -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_RBRACE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_QUOTE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_QUESTION -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_PRIVATE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_PREFIXOP -> "!"
    | MenhirInterpreter.T MenhirInterpreter.T_PLUSEQ -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_PLUSDOT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_PLUS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_PERCENT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_P4_QUOTATION -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_TEST_UNIT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_TEST_MODULE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_TEST -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_BENCH_MODULE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_BENCH_INDEXED -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_BENCH_FUN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OUNIT_BENCH -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OPTLABEL -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_OPEN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OF -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_OBJECT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_NONREC -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_NEW -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_NATIVEINT -> 0n
    | MenhirInterpreter.T MenhirInterpreter.T_MUTABLE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MODULE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MINUSGREATER -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MINUSDOT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MINUS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_METHOD -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MATCH_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_MATCH -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LPAREN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LIDENT -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_LET_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LETOP -> ""
    | MenhirInterpreter.T MenhirInterpreter.T_LET -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LESSMINUS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LESS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETPERCENTPERCENT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETPERCENT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETLESS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETGREATER -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETBAR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETATATAT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETATAT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKETAT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACKET -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACELESS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LBRACE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LAZY -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_LABEL -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_JSNEW -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_INT64 -> 0L
    | MenhirInterpreter.T MenhirInterpreter.T_INT32 -> 0l
    | MenhirInterpreter.T MenhirInterpreter.T_INT -> 0
    | MenhirInterpreter.T MenhirInterpreter.T_INITIALIZER -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_INHERIT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_INFIXOP4 -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_INFIXOP3 -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_INFIXOP2 -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_INFIXOP1 -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_INFIXOP0 -> "_"
    | MenhirInterpreter.T MenhirInterpreter.T_INCLUDE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_IN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_IF -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_GREATERRBRACKET -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_GREATERRBRACE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_GREATERDOT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_GREATER -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FUNCTOR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FUNCTION -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FUN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FOR_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FOR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FLOAT -> "0."
    | MenhirInterpreter.T MenhirInterpreter.T_FINALLY_LWT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_FALSE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EXTERNAL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EXITPOINT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EXCEPTION -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EQUAL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EOL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_EOF -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_END -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_ELSE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DOWNTO -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DOTTILDE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DOTLESS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DOTDOT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DOT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DONE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_DO -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_CUSTOM_BANG -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_CONSTRAINT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_COMMENT -> ("", Location.none)
    | MenhirInterpreter.T MenhirInterpreter.T_COMMA -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_COLONGREATER -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_COLONEQUAL -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_COLONCOLON -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_COLON -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_CLASS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_CHAR -> '_'
    | MenhirInterpreter.T MenhirInterpreter.T_BEGIN -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_BARRBRACKET -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_BARBAR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_BAR -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_BANG -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_BACKQUOTE -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_ASSERT -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_AS -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_AND -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_AMPERSAND -> ()
    | MenhirInterpreter.T MenhirInterpreter.T_AMPERAMPER -> ()
    | MenhirInterpreter.N MenhirInterpreter.N_with_type_binder -> Public
    | MenhirInterpreter.N MenhirInterpreter.N_with_extensions -> []
    | MenhirInterpreter.N MenhirInterpreter.N_with_constraints -> []
    | MenhirInterpreter.N MenhirInterpreter.N_with_constraint -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_virtual_flag -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_value_type -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_value -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_val_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_val_ident -> ""
    | MenhirInterpreter.N MenhirInterpreter.N_typevar_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_type_variance -> Invariant
    | MenhirInterpreter.N MenhirInterpreter.N_type_variable -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_type_parameters -> []
    | MenhirInterpreter.N MenhirInterpreter.N_type_parameter_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_type_parameter -> default_type, Invariant
    | MenhirInterpreter.N MenhirInterpreter.N_type_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_type_kind -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_type_declarations -> []
    | MenhirInterpreter.N MenhirInterpreter.N_type_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_type_constraint -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_toplevel_directives -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_tag_field -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_subtractive -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_structure_tail -> []
    | MenhirInterpreter.N MenhirInterpreter.N_structure_item -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_structure_head -> []
    | MenhirInterpreter.N MenhirInterpreter.N_structure -> []
    | MenhirInterpreter.N MenhirInterpreter.N_strict_binding -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_str_type_extension -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_str_extension_constructors -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_str_exception_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_single_attr_id -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_simple_pattern_not_ident -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_simple_pattern -> default_pattern
    | MenhirInterpreter.N MenhirInterpreter.N_simple_labeled_expr_list -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_simple_expr -> default_expr
    | MenhirInterpreter.N MenhirInterpreter.N_simple_core_type_or_tuple_no_attr -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_simple_core_type_or_tuple -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_simple_core_type_no_attr -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_simple_core_type2 -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_simple_core_type -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_signed_constant -> Const_int 0
    | MenhirInterpreter.N MenhirInterpreter.N_signature_item -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_signature -> []
    | MenhirInterpreter.N MenhirInterpreter.N_sig_type_extension -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_sig_extension_constructors -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_sig_exception_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_seq_expr -> default_expr
    | MenhirInterpreter.N MenhirInterpreter.N_row_field_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_row_field -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_record_expr -> None, []
    | MenhirInterpreter.N MenhirInterpreter.N_rec_module_declarations -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_rec_flag -> Nonrecursive
    | MenhirInterpreter.N MenhirInterpreter.N_private_virtual_flags -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_private_flag -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_primitive_declaration -> []
    | MenhirInterpreter.N MenhirInterpreter.N_post_item_attributes -> []
    | MenhirInterpreter.N MenhirInterpreter.N_post_item_attribute -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_poly_type_no_attr -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_poly_type -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_payload -> Parsetree.PStr []
    | MenhirInterpreter.N MenhirInterpreter.N_pattern_var -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_pattern_semi_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_pattern_comma_list -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_pattern -> default_pattern
    | MenhirInterpreter.N MenhirInterpreter.N_parse_expression -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_parent_binder -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_package_type_cstrs -> []
    | MenhirInterpreter.N MenhirInterpreter.N_package_type_cstr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_package_type -> default_longident_loc, []
    | MenhirInterpreter.N MenhirInterpreter.N_override_flag -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_optional_type_variable -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_optional_type_parameters -> []
    | MenhirInterpreter.N MenhirInterpreter.N_optional_type_parameter_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_optional_type_parameter -> default_type, Invariant
    | MenhirInterpreter.N MenhirInterpreter.N_option_STRING_ -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_opt_semi -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_opt_default -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_opt_bar -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_opt_ampersand -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_operator -> ""
    | MenhirInterpreter.N MenhirInterpreter.N_open_statement -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_newtype -> ""
    | MenhirInterpreter.N MenhirInterpreter.N_name_tag_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_name_tag -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_mutable_flag -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_mty_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_module_type -> default_module_type
    | MenhirInterpreter.N MenhirInterpreter.N_module_rec_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_module_expr -> default_module_expr
    | MenhirInterpreter.N MenhirInterpreter.N_module_declaration -> default_module_type
    | MenhirInterpreter.N MenhirInterpreter.N_module_bindings -> []
    | MenhirInterpreter.N MenhirInterpreter.N_module_binding_body -> default_module_expr
    | MenhirInterpreter.N MenhirInterpreter.N_module_binding -> default_module_bind
    | MenhirInterpreter.N MenhirInterpreter.N_mod_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_mod_ext_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_method_ -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_meth_list -> [], Open
    | MenhirInterpreter.N MenhirInterpreter.N_match_cases -> []
    | MenhirInterpreter.N MenhirInterpreter.N_match_case -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_lident_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_let_pattern -> default_pattern
    | MenhirInterpreter.N MenhirInterpreter.N_let_operator -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_let_bindings_no_attrs -> []
    | MenhirInterpreter.N MenhirInterpreter.N_let_bindings -> []
    | MenhirInterpreter.N MenhirInterpreter.N_let_binding_ -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_let_binding -> default_value_bind
    | MenhirInterpreter.N MenhirInterpreter.N_lbl_pattern_list -> [], Closed
    | MenhirInterpreter.N MenhirInterpreter.N_lbl_pattern -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_lbl_expr_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_lbl_expr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_labeled_simple_pattern -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_labeled_simple_expr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_label_var -> "", default_pattern
    | MenhirInterpreter.N MenhirInterpreter.N_label_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_label_let_pattern -> "", default_pattern
    | MenhirInterpreter.N MenhirInterpreter.N_label_ident -> "", default_expr
    | MenhirInterpreter.N MenhirInterpreter.N_label_expr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_label_declarations -> []
    | MenhirInterpreter.N MenhirInterpreter.N_label_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_label -> ""
    | MenhirInterpreter.N MenhirInterpreter.N_item_extension -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_interface -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_implementation -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_ident -> ""
    | MenhirInterpreter.N MenhirInterpreter.N_generalized_constructor_arguments -> ([],None)
    | MenhirInterpreter.N MenhirInterpreter.N_functor_args -> []
    | MenhirInterpreter.N MenhirInterpreter.N_functor_arg_name -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_functor_arg -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_fun_def -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_fun_binding -> default_expr
    | MenhirInterpreter.N MenhirInterpreter.N_floating_attribute -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_field_expr_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_field -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_extension_constructor_rebind -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_extension_constructor_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_extension -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_ext_attributes -> (None, [])
    | MenhirInterpreter.N MenhirInterpreter.N_expr_semi_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_expr_open -> Fresh, default_longident_loc, (None, [])
    | MenhirInterpreter.N MenhirInterpreter.N_expr_comma_opt_list -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_expr_comma_list -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_expr -> default_expr
    | MenhirInterpreter.N MenhirInterpreter.N_dummy -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_direction_flag -> Upto
    | MenhirInterpreter.N MenhirInterpreter.N_core_type_no_attr -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_core_type_list_no_attr -> []
    | MenhirInterpreter.N MenhirInterpreter.N_core_type_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_core_type_comma_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_core_type2 -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_core_type -> default_type
    | MenhirInterpreter.N MenhirInterpreter.N_constructor_declarations -> []
    | MenhirInterpreter.N MenhirInterpreter.N_constructor_declaration -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_constraints -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_constrain_field -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_constrain -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_constr_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_constr_ident -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_constant -> Const_int 0
    | MenhirInterpreter.N MenhirInterpreter.N_clty_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_class_type_parameters -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_type_declarations -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_type_declaration -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_type -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_structure -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_simple_expr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_signature -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_sig_fields -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_sig_field -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_sig_body -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_self_type -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_self_pattern -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_longident -> default_longident
    | MenhirInterpreter.N MenhirInterpreter.N_class_fun_def -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_fun_binding -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_fields -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_field -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_expr -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_class_descriptions -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_description -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_declarations -> []
    | MenhirInterpreter.N MenhirInterpreter.N_class_declaration -> []
    | MenhirInterpreter.N MenhirInterpreter.N_attributes -> []
    | MenhirInterpreter.N MenhirInterpreter.N_attribute -> raise Not_found
    | MenhirInterpreter.N MenhirInterpreter.N_attr_id -> Location.mknoloc ""
    | MenhirInterpreter.N MenhirInterpreter.N_amper_type_list -> []
    | MenhirInterpreter.N MenhirInterpreter.N_additive -> raise Not_found
end

let default_value = Default.value

open MenhirInterpreter

type action =
  | Abort
  | Pop
  | R of int
  | S : 'a symbol -> action
  | Sub of action list

type decision =
  | Nothing
  | One of action list
  | Select of (int -> action list)

let depth =
  [|0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;3;2;1;2;1;1;1;1;1;1;1;1;2;1;2;3;4;2;3;2;3;1;2;2;2;2;2;1;1;2;2;2;2;2;1;1;1;2;1;1;1;1;1;1;2;3;4;4;1;1;5;6;1;2;1;1;1;2;3;3;2;3;1;1;1;1;2;3;2;1;1;2;1;2;3;1;1;2;3;4;1;2;3;3;1;1;2;1;1;2;1;2;3;1;2;1;2;1;2;1;1;1;2;1;2;2;1;2;1;2;1;1;1;2;3;2;1;3;4;2;3;1;2;1;3;1;1;2;1;1;3;2;3;1;1;2;3;2;3;4;4;2;3;5;1;2;2;1;2;3;2;3;4;5;3;4;3;4;4;5;6;2;1;1;2;2;1;2;1;3;4;1;2;3;2;3;3;4;1;1;2;3;2;3;4;5;2;3;4;5;4;2;3;1;2;3;4;4;5;6;4;3;1;2;3;1;1;1;1;1;1;1;2;1;2;3;1;2;3;1;4;3;1;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;3;1;1;2;3;2;3;2;1;2;1;2;1;1;2;2;1;1;1;1;1;1;1;2;3;2;3;3;4;5;2;3;2;1;1;1;2;3;3;2;1;1;3;2;2;3;3;4;1;2;2;3;4;2;3;4;5;6;7;8;2;3;1;2;1;2;1;2;1;1;1;2;3;1;2;1;1;1;1;1;1;2;1;2;3;3;4;5;3;4;1;2;1;1;1;2;3;4;5;1;1;2;1;2;3;4;3;1;2;1;2;3;4;5;6;2;3;4;1;1;1;2;1;2;1;1;1;2;1;2;3;1;2;1;1;2;1;3;1;1;2;1;1;2;3;3;4;2;1;2;3;1;1;1;2;1;2;3;3;4;1;1;2;1;2;1;1;1;1;1;1;2;1;1;2;1;2;1;2;3;1;2;1;2;1;1;2;1;2;3;3;4;5;1;2;1;2;3;4;1;2;1;3;1;1;2;3;4;1;2;3;4;1;1;1;2;1;1;2;3;4;1;1;1;1;2;2;3;1;1;2;3;4;5;1;1;2;1;1;1;1;1;2;2;2;3;2;3;1;3;4;1;2;3;5;2;3;1;2;1;1;1;2;1;2;1;1;3;3;2;1;1;3;1;1;1;2;3;1;1;2;1;2;3;1;2;2;3;1;2;3;4;1;2;3;1;2;2;3;1;2;3;4;5;4;2;3;5;6;1;3;4;2;3;1;4;4;5;6;7;8;5;6;2;3;4;2;1;2;3;3;5;1;1;2;3;4;2;1;2;2;3;4;5;6;2;3;1;2;3;7;1;1;1;2;3;4;1;2;1;2;3;1;2;3;4;2;3;3;4;2;1;1;1;1;2;3;1;4;2;1;1;1;1;2;2;2;3;2;3;1;2;1;3;1;2;4;5;6;3;4;5;1;1;2;3;4;2;3;4;3;2;3;1;2;1;2;1;2;3;4;5;1;2;6;2;3;3;4;5;3;4;2;3;4;5;6;4;2;1;2;3;4;3;2;3;1;1;2;3;4;1;2;3;4;1;2;3;1;2;3;4;5;1;2;6;7;1;2;3;4;1;2;1;1;2;1;1;2;3;2;3;4;1;1;2;3;2;3;1;2;1;1;2;3;4;5;1;2;3;4;5;2;3;1;2;3;1;1;2;1;2;2;3;4;1;2;3;5;6;1;1;1;1;2;3;1;2;3;4;1;1;2;3;2;1;1;2;3;2;3;1;2;1;2;5;6;3;2;3;1;1;2;3;4;1;2;3;4;5;1;2;3;1;2;3;4;1;1;1;2;1;2;3;1;2;3;1;3;1;5;4;6;5;6;2;2;3;1;1;2;1;1;2;1;2;2;3;4;5;2;3;4;5;6;7;8;1;1;1;1;2;1;1;1;1;1;2;3;2;3;4;5;1;1;1;1;2;2;3;1;2;2;3;2;3;4;5;1;2;3;3;1;2;1;2;3;4;5;1;2;1;2;3;2;3;2;3;2;1;2;2;3;1;2;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;2;3;3;2;3;2;3;1;2;3;1;2;3;3;4;5;2;1;2;3;1;4;2;3;5;6;1;3;4;5;6;3;4;2;3;4;5;5;6;3;1;2;3;1;2;3;1;2;3;4;5;1;2;3;3;1;3;4;5;3;4;5;3;4;3;4;5;1;2;1;2;1;2;2;3;4;5;6;7;3;4;5;6;7;3;4;5;6;7;3;4;5;2;1;2;1;1;2;5;6;2;3;1;4;5;5;1;1;6;7;8;9;10;5;6;7;8;4;5;6;7;8;9;10;2;1;2;3;4;1;2;5;4;3;4;3;4;5;2;3;4;2;3;1;3;4;5;6;7;3;3;4;3;2;3;2;2;3;4;4;5;2;3;3;2;3;4;2;3;4;5;2;3;4;1;2;1;2;3;4;5;6;7;1;2;2;3;4;5;6;1;2;4;5;2;1;2;3;4;1;2;1;2;1;2;3;4;1;2;3;1;1;2;5;2;3;1;2;4;5;6;7;8;3;4;5;6;7;2;4;5;6;3;4;4;5;6;4;5;6;6;7;8;2;3;3;4;5;3;4;4;5;6;2;3;4;5;6;7;8;2;3;3;4;3;4;5;6;3;4;5;6;5;4;5;6;1;1;2;3;4;5;6;2;3;4;5;6;2;3;4;5;6;7;8;9;10;5;6;7;4;2;3;1;2;3;1;2;1;2;3;1;1;2;3;4;1;2;3;4;1;1;2;1;1;2;1;3;2;2;2;5;2;3;3;4;5;3;1;2;4;5;1;2;3;1;2;1;2;2;2;3;4;2;3;4;5;6;3;4;5;6;7;8;4;5;3;4;5;6;4;3;4;3;2;3;4;5;6;1;2;3;4;5;2;3;4;2;1;2;3;4;5;6;2;3;3;1;2;1;1;3;4;7;1;1;2;3;4;4;4;4;4;1;2;1;2;1;1;2;3;4;1;2;3;4;1;2;3;4;1;2;3;4;1;2;3;4;5;6;1;2;3;4;1;2;3;4;1;1;2;3;2;3;4;5;6;4;2;3;2;3;1;2;1;2;3;4;1;2;3;4;1;2;3;1;2;3;4;5;6;7;1;2;3;4;1;2;1;2;1;2;3;1;2;3;1;2;1;2;3;4;1;2;4;5;2;2;3;1;2;1;1;2;3;4;1;2;3;4;2;1;1;2;1;2;3;4;1;2;1;0;1;2;1;0;1;2;1;|]
let recover =
  let r0 = [R 637] in
  let r1 = [R 147] in
  let r2 = S (T T_DONE) :: r1 in
  let r3 = S (N N_seq_expr) :: r2 in
  let r4 = S (T T_DO) :: r3 in
  let r5 = S (N N_seq_expr) :: r4 in
  let r6 = [R 210] in
  let r7 = S (N N_attributes) :: r6 in
  let r8 = [Pop] in
  let r9 = [R 10] in
  let r10 = S (T T_RBRACKET) :: r9 in
  let r11 = S (N N_payload) :: r10 in
  let r12 = [R 418] in
  let r13 = [R 564] in
  let r14 = [R 697] in
  let r15 = S (T T_LIDENT) :: r14 in
  let r16 = S (T T_DOT) :: r15 in
  let r17 = [R 302] in
  let r18 = S (T T_RPAREN) :: r17 in
  let r19 = [R 482] in
  let r20 = [R 477] in
  let r21 = [R 569] in
  let r22 = S (T T_RPAREN) :: r21 in
  let r23 = S (T T_COLONCOLON) :: r8 in
  let r24 = [R 92] in
  let r25 = [R 571] in
  let r26 = [R 572] in
  let r27 = [R 393] in
  let r28 = S (N N_core_type) :: r27 in
  let r29 = S (T T_EQUAL) :: r28 in
  let r30 = [R 250] in
  let r31 = S (T T_LIDENT) :: r30 in
  let r32 = [R 496] in
  let r33 = [R 40] in
  let r34 = S (T T_LIDENT) :: r33 in
  let r35 = [R 489] in
  let r36 = [R 105] in
  let r37 = S (N N_core_type2) :: r36 in
  let r38 = S (T T_MINUSGREATER) :: r37 in
  let r39 = S (N N_core_type2) :: r38 in
  let r40 = S (T T_COLON) :: r39 in
  let r41 = [R 106] in
  let r42 = S (N N_core_type2) :: r41 in
  let r43 = S (T T_MINUSGREATER) :: r42 in
  let r44 = [R 488] in
  let r45 = S (T T_RPAREN) :: r44 in
  let r46 = [R 506] in
  let r47 = S (T T_RPAREN) :: r46 in
  let r48 = [R 337] in
  let r49 = S (N N_ident) :: r48 in
  let r50 = S (T T_COLON) :: r8 in
  let r51 = [R 495] in
  let r52 = [R 494] in
  let r53 = [R 214] in
  let r54 = S (N N_attributes) :: r53 in
  let r55 = S (N N_poly_type_no_attr) :: r54 in
  let r56 = [R 708] in
  let r57 = [R 211] in
  let r58 = S (T T_RBRACKET) :: r57 in
  let r59 = S (N N_payload) :: r58 in
  let r60 = [R 417] in
  let r61 = [R 504] in
  let r62 = S (T T_RBRACKET) :: r61 in
  let r63 = S (N N_row_field_list) :: r62 in
  let r64 = [R 503] in
  let r65 = [R 502] in
  let r66 = S (T T_RBRACKET) :: r65 in
  let r67 = [R 500] in
  let r68 = S (T T_RBRACKET) :: r67 in
  let r69 = S (N N_row_field_list) :: r68 in
  let r70 = [R 340] in
  let r71 = [R 671] in
  let r72 = [R 670] in
  let r73 = S (N N_attributes) :: r72 in
  let r74 = [R 7] in
  let r75 = [R 12] in
  let r76 = [R 499] in
  let r77 = [R 501] in
  let r78 = S (T T_RBRACKET) :: r77 in
  let r79 = S (N N_row_field_list) :: r78 in
  let r80 = [R 505] in
  let r81 = [R 423] in
  let r82 = S (N N_core_type_no_attr) :: r81 in
  let r83 = [R 709] in
  let r84 = [R 293] in
  let r85 = [R 107] in
  let r86 = S (N N_core_type2) :: r85 in
  let r87 = [R 110] in
  let r88 = [R 568] in
  let r89 = [R 566] in
  let r90 = S (T T_RBRACKET) :: r89 in
  let r91 = R 376 :: r90 in
  let r92 = [R 91] in
  let r93 = [R 565] in
  let r94 = S (T T_RBRACE) :: r93 in
  let r95 = [R 407] in
  let r96 = [R 408] in
  let r97 = [R 404] in
  let r98 = [R 403] in
  let r99 = [R 402] in
  let r100 = [R 411] in
  let r101 = [R 570] in
  let r102 = [R 406] in
  let r103 = [R 400] in
  let r104 = [R 711] in
  let r105 = S (T T_RPAREN) :: r104 in
  let r106 = [R 567] in
  let r107 = S (T T_BARRBRACKET) :: r106 in
  let r108 = [R 405] in
  let r109 = S (T T_RPAREN) :: r108 in
  let r110 = S (N N_pattern) :: r109 in
  let r111 = [R 166] in
  let r112 = S (T T_DONE) :: r111 in
  let r113 = S (N N_seq_expr) :: r112 in
  let r114 = S (T T_DO) :: r113 in
  let r115 = S (N N_seq_expr) :: r114 in
  let r116 = [R 143] in
  let r117 = S (N N_seq_expr) :: r116 in
  let r118 = [R 160] in
  let r119 = S (N N_match_cases) :: r118 in
  let r120 = R 372 :: r119 in
  let r121 = S (T T_WITH) :: r120 in
  let r122 = S (N N_seq_expr) :: r121 in
  let r123 = [R 543] in
  let r124 = [R 545] in
  let r125 = S (N N_class_longident) :: r124 in
  let r126 = [R 209] in
  let r127 = [R 525] in
  let r128 = S (T T_RPAREN) :: r127 in
  let r129 = [R 539] in
  let r130 = [R 65] in
  let r131 = S (N N_class_fields) :: r130 in
  let r132 = R 43 :: r131 in
  let r133 = [R 199] in
  let r134 = S (T T_END) :: r133 in
  let r135 = Sub (r132) :: r134 in
  let r136 = [R 41] in
  let r137 = S (T T_RPAREN) :: r136 in
  let r138 = [R 42] in
  let r139 = S (T T_VIRTUAL) :: r8 in
  let r140 = S (T T_MUTABLE) :: r139 in
  let r141 = R 389 :: r140 in
  let r142 = [R 26] in
  let r143 = S (N N_post_item_attributes) :: r142 in
  let r144 = [R 715] in
  let r145 = S (N N_core_type) :: r144 in
  let r146 = S (T T_COLON) :: r145 in
  let r147 = S (N N_label) :: r146 in
  let r148 = [R 424] in
  let r149 = S (T T_RBRACKET) :: r148 in
  let r150 = S (N N_payload) :: r149 in
  let r151 = [R 426] in
  let r152 = [R 714] in
  let r153 = S (N N_core_type) :: r152 in
  let r154 = [R 716] in
  let r155 = S (N N_seq_expr) :: r154 in
  let r156 = S (T T_EQUAL) :: r155 in
  let r157 = [R 142] in
  let r158 = S (N N_match_cases) :: r157 in
  let r159 = R 372 :: r158 in
  let r160 = S (T T_WITH) :: r159 in
  let r161 = S (N N_seq_expr) :: r160 in
  let r162 = [R 159] in
  let r163 = S (N N_match_cases) :: r162 in
  let r164 = R 372 :: r163 in
  let r165 = S (T T_WITH) :: r164 in
  let r166 = S (N N_seq_expr) :: r165 in
  let r167 = [R 315] in
  let r168 = S (T T_END) :: r167 in
  let r169 = [R 320] in
  let r170 = S (T T_RPAREN) :: r169 in
  let r171 = [R 321] in
  let r172 = S (T T_RPAREN) :: r171 in
  let r173 = [R 141] in
  let r174 = S (N N_seq_expr) :: r173 in
  let r175 = S (T T_IN) :: r174 in
  let r176 = S (N N_let_bindings) :: r175 in
  let r177 = S (N N_rec_flag) :: r176 in
  let r178 = [R 274] in
  let r179 = [R 259] in
  let r180 = [R 258] in
  let r181 = [R 255] in
  let r182 = [R 254] in
  let r183 = S (T T_RPAREN) :: r182 in
  let r184 = [R 375] in
  let r185 = [R 155] in
  let r186 = S (N N_seq_expr) :: r185 in
  let r187 = S (T T_IN) :: r186 in
  let r188 = S (N N_expr_open) :: r187 in
  let r189 = [R 205] in
  let r190 = S (N N_mod_longident) :: r189 in
  let r191 = [R 541] in
  let r192 = S (T T_RBRACKET) :: r191 in
  let r193 = R 376 :: r192 in
  let r194 = [R 547] in
  let r195 = [R 215] in
  let r196 = S (N N_expr) :: r195 in
  let r197 = [R 536] in
  let r198 = S (T T_RBRACE) :: r197 in
  let r199 = [R 516] in
  let r200 = S (T T_RPAREN) :: r199 in
  let r201 = S (T T_LPAREN) :: r200 in
  let r202 = [R 527] in
  let r203 = [R 526] in
  let r204 = S (T T_GREATERDOT) :: r203 in
  let r205 = [R 198] in
  let r206 = S (N N_simple_expr) :: r205 in
  let r207 = [R 514] in
  let r208 = [R 529] in
  let r209 = S (T T_END) :: r208 in
  let r210 = [R 165] in
  let r211 = S (N N_expr) :: r210 in
  let r212 = S (T T_THEN) :: r211 in
  let r213 = S (N N_seq_expr) :: r212 in
  let r214 = [R 156] in
  let r215 = S (N N_match_cases) :: r214 in
  let r216 = R 372 :: r215 in
  let r217 = [R 288] in
  let r218 = S (N N_seq_expr) :: r217 in
  let r219 = [R 220] in
  let r220 = S (N N_seq_expr) :: r219 in
  let r221 = S (T T_MINUSGREATER) :: r220 in
  let r222 = [R 158] in
  let r223 = Sub (r221) :: r222 in
  let r224 = S (N N_newtype) :: r223 in
  let r225 = [R 415] in
  let r226 = S (T T_UNDERSCORE) :: r225 in
  let r227 = [R 257] in
  let r228 = [R 256] in
  let r229 = S (T T_RPAREN) :: r228 in
  let r230 = S (T T_TYPE) :: r8 in
  let r231 = [R 343] in
  let r232 = [R 260] in
  let r233 = [R 261] in
  let r234 = S (T T_EQUAL) :: r8 in
  let r235 = S (N N_pattern) :: r234 in
  let r236 = S (N N_ext_attributes) :: r235 in
  let r237 = [R 544] in
  let r238 = S (T T_DOT) :: r8 in
  let r239 = [R 316] in
  let r240 = S (N N_module_expr) :: r239 in
  let r241 = S (T T_MINUSGREATER) :: r240 in
  let r242 = [R 223] in
  let r243 = [R 224] in
  let r244 = S (T T_RPAREN) :: r243 in
  let r245 = S (N N_module_type) :: r244 in
  let r246 = [R 329] in
  let r247 = S (T T_END) :: r246 in
  let r248 = [R 460] in
  let r249 = S (N N_post_item_attributes) :: r248 in
  let r250 = S (N N_core_type) :: r249 in
  let r251 = S (T T_COLON) :: r250 in
  let r252 = [R 462] in
  let r253 = [R 456] in
  let r254 = [R 385] in
  let r255 = S (T T_RPAREN) :: r254 in
  let r256 = [R 380] in
  let r257 = [R 386] in
  let r258 = [R 382] in
  let r259 = [R 682] in
  let r260 = S (N N_post_item_attributes) :: r259 in
  let r261 = R 98 :: r260 in
  let r262 = R 685 :: r261 in
  let r263 = S (T T_LIDENT) :: r262 in
  let r264 = [R 686] in
  let r265 = [R 687] in
  let r266 = [R 86] in
  let r267 = [R 87] in
  let r268 = [R 99] in
  let r269 = S (N N_attributes) :: r268 in
  let r270 = [R 230] in
  let r271 = [R 509] in
  let r272 = S (T T_RPAREN) :: r271 in
  let r273 = S (N N_core_type_comma_list) :: r272 in
  let r274 = [R 114] in
  let r275 = S (N N_simple_core_type_no_attr) :: r274 in
  let r276 = [R 232] in
  let r277 = [R 231] in
  let r278 = S (N N_simple_core_type_no_attr) :: r277 in
  let r279 = [R 690] in
  let r280 = S (N N_constructor_declarations) :: r279 in
  let r281 = [R 239] in
  let r282 = S (N N_attributes) :: r281 in
  let r283 = S (N N_poly_type_no_attr) :: r282 in
  let r284 = S (T T_COLON) :: r283 in
  let r285 = [R 691] in
  let r286 = S (T T_RBRACE) :: r285 in
  let r287 = [R 692] in
  let r288 = S (N N_constructor_declarations) :: r287 in
  let r289 = [R 693] in
  let r290 = S (T T_RBRACE) :: r289 in
  let r291 = [R 95] in
  let r292 = S (N N_core_type) :: r291 in
  let r293 = S (T T_COLONCOLON) :: r267 in
  let r294 = [R 212] in
  let r295 = S (N N_attributes) :: r294 in
  let r296 = S (N N_generalized_constructor_arguments) :: r295 in
  let r297 = Sub (r293) :: r296 in
  let r298 = [R 450] in
  let r299 = Sub (r297) :: r298 in
  let r300 = [R 452] in
  let r301 = S (N N_post_item_attributes) :: r300 in
  let r302 = Sub (r299) :: r301 in
  let r303 = R 372 :: r302 in
  let r304 = R 429 :: r303 in
  let r305 = [R 454] in
  let r306 = [R 344] in
  let r307 = S (N N_post_item_attributes) :: r306 in
  let r308 = S (N N_mod_longident) :: r307 in
  let r309 = [R 468] in
  let r310 = S (N N_post_item_attributes) :: r309 in
  let r311 = S (N N_ident) :: r310 in
  let r312 = [R 465] in
  let r313 = S (N N_post_item_attributes) :: r312 in
  let r314 = [R 313] in
  let r315 = S (N N_module_declaration) :: r314 in
  let r316 = [R 312] in
  let r317 = S (N N_module_declaration) :: r316 in
  let r318 = S (T T_RPAREN) :: r317 in
  let r319 = S (N N_module_type) :: r318 in
  let r320 = [R 332] in
  let r321 = S (N N_module_expr) :: r320 in
  let r322 = S (T T_OF) :: r321 in
  let r323 = [R 318] in
  let r324 = [R 317] in
  let r325 = [R 333] in
  let r326 = S (T T_RPAREN) :: r325 in
  let r327 = [R 330] in
  let r328 = S (N N_module_type) :: r327 in
  let r329 = S (T T_MINUSGREATER) :: r328 in
  let r330 = [R 331] in
  let r331 = [R 724] in
  let r332 = S (N N_core_type_no_attr) :: r331 in
  let r333 = S (T T_COLONEQUAL) :: r332 in
  let r334 = S (N N_label) :: r333 in
  let r335 = [R 703] in
  let r336 = S (T T_RPAREN) :: r335 in
  let r337 = [R 698] in
  let r338 = [R 704] in
  let r339 = [R 700] in
  let r340 = [R 723] in
  let r341 = R 98 :: r340 in
  let r342 = S (N N_core_type_no_attr) :: r341 in
  let r343 = [R 725] in
  let r344 = S (N N_mod_ext_longident) :: r343 in
  let r345 = S (T T_EQUAL) :: r344 in
  let r346 = [R 311] in
  let r347 = [R 466] in
  let r348 = S (N N_post_item_attributes) :: r347 in
  let r349 = [R 469] in
  let r350 = [R 327] in
  let r351 = S (N N_post_item_attributes) :: r350 in
  let r352 = S (N N_module_type) :: r351 in
  let r353 = [R 237] in
  let r354 = S (T T_RBRACKET) :: r353 in
  let r355 = S (N N_payload) :: r354 in
  let r356 = [R 217] in
  let r357 = S (T T_RBRACKET) :: r356 in
  let r358 = S (N N_payload) :: r357 in
  let r359 = [R 471] in
  let r360 = S (N N_post_item_attributes) :: r359 in
  let r361 = [R 461] in
  let r362 = S (N N_post_item_attributes) :: r361 in
  let r363 = S (N N_primitive_declaration) :: r362 in
  let r364 = S (T T_EQUAL) :: r363 in
  let r365 = S (N N_core_type) :: r364 in
  let r366 = S (T T_COLON) :: r365 in
  let r367 = [R 449] in
  let r368 = S (N N_post_item_attributes) :: r367 in
  let r369 = Sub (r297) :: r368 in
  let r370 = [R 464] in
  let r371 = [R 472] in
  let r372 = [R 473] in
  let r373 = [R 56] in
  let r374 = S (N N_clty_longident) :: r373 in
  let r375 = [R 71] in
  let r376 = S (N N_post_item_attributes) :: r375 in
  let r377 = Sub (r374) :: r376 in
  let r378 = S (T T_EQUAL) :: r377 in
  let r379 = S (T T_LIDENT) :: r378 in
  let r380 = [R 75] in
  let r381 = S (T T_RBRACKET) :: r380 in
  let r382 = [R 46] in
  let r383 = R 53 :: r382 in
  let r384 = R 45 :: r383 in
  let r385 = [R 57] in
  let r386 = S (T T_END) :: r385 in
  let r387 = [R 44] in
  let r388 = S (T T_RPAREN) :: r387 in
  let r389 = [R 720] in
  let r390 = S (N N_core_type) :: r389 in
  let r391 = S (T T_COLON) :: r390 in
  let r392 = S (N N_label) :: r391 in
  let r393 = [R 48] in
  let r394 = S (N N_post_item_attributes) :: r393 in
  let r395 = [R 718] in
  let r396 = S (N N_core_type) :: r395 in
  let r397 = S (T T_COLON) :: r396 in
  let r398 = S (N N_label) :: r397 in
  let r399 = [R 719] in
  let r400 = S (N N_core_type) :: r399 in
  let r401 = S (T T_COLON) :: r400 in
  let r402 = S (N N_label) :: r401 in
  let r403 = [R 49] in
  let r404 = S (N N_post_item_attributes) :: r403 in
  let r405 = S (N N_poly_type) :: r404 in
  let r406 = S (T T_COLON) :: r405 in
  let r407 = S (N N_label) :: r406 in
  let r408 = [R 421] in
  let r409 = S (N N_core_type) :: r408 in
  let r410 = [R 47] in
  let r411 = S (N N_post_item_attributes) :: r410 in
  let r412 = [R 55] in
  let r413 = S (N N_clty_longident) :: r412 in
  let r414 = S (T T_RBRACKET) :: r413 in
  let r415 = [R 77] in
  let r416 = S (T T_LIDENT) :: r415 in
  let r417 = [R 96] in
  let r418 = S (N N_core_type) :: r417 in
  let r419 = S (T T_EQUAL) :: r418 in
  let r420 = S (N N_core_type) :: r419 in
  let r421 = [R 50] in
  let r422 = S (N N_post_item_attributes) :: r421 in
  let r423 = [R 51] in
  let r424 = [R 66] in
  let r425 = Sub (r374) :: r424 in
  let r426 = [R 16] in
  let r427 = S (N N_post_item_attributes) :: r426 in
  let r428 = Sub (r425) :: r427 in
  let r429 = S (T T_COLON) :: r428 in
  let r430 = S (T T_LIDENT) :: r429 in
  let r431 = [R 67] in
  let r432 = Sub (r425) :: r431 in
  let r433 = S (T T_MINUSGREATER) :: r432 in
  let r434 = S (N N_simple_core_type_or_tuple_no_attr) :: r433 in
  let r435 = S (T T_COLON) :: r434 in
  let r436 = [R 68] in
  let r437 = Sub (r425) :: r436 in
  let r438 = S (T T_MINUSGREATER) :: r437 in
  let r439 = [R 69] in
  let r440 = Sub (r425) :: r439 in
  let r441 = [R 70] in
  let r442 = Sub (r425) :: r441 in
  let r443 = [R 455] in
  let r444 = [R 474] in
  let r445 = [R 553] in
  let r446 = S (T T_RPAREN) :: r445 in
  let r447 = S (N N_package_type) :: r446 in
  let r448 = [R 197] in
  let r449 = S (N N_simple_expr) :: r448 in
  let r450 = [R 518] in
  let r451 = [R 190] in
  let r452 = [R 243] in
  let r453 = [R 550] in
  let r454 = [R 531] in
  let r455 = [R 533] in
  let r456 = S (T T_RPAREN) :: r455 in
  let r457 = [R 153] in
  let r458 = S (N N_seq_expr) :: r457 in
  let r459 = S (T T_IN) :: r458 in
  let r460 = S (N N_let_bindings) :: r459 in
  let r461 = [R 278] in
  let r462 = S (N N_seq_expr) :: r461 in
  let r463 = [R 196] in
  let r464 = S (N N_expr) :: r463 in
  let r465 = [R 180] in
  let r466 = [R 174] in
  let r467 = [R 549] in
  let r468 = [R 191] in
  let r469 = [R 177] in
  let r470 = [R 181] in
  let r471 = [R 173] in
  let r472 = [R 176] in
  let r473 = [R 175] in
  let r474 = [R 185] in
  let r475 = [R 179] in
  let r476 = [R 178] in
  let r477 = [R 183] in
  let r478 = [R 172] in
  let r479 = [R 171] in
  let r480 = [R 168] in
  let r481 = [R 170] in
  let r482 = [R 184] in
  let r483 = [R 182] in
  let r484 = [R 186] in
  let r485 = [R 187] in
  let r486 = [R 188] in
  let r487 = [R 202] in
  let r488 = [R 189] in
  let r489 = [R 277] in
  let r490 = S (N N_seq_expr) :: r489 in
  let r491 = [R 280] in
  let r492 = [R 273] in
  let r493 = [R 540] in
  let r494 = S (T T_BARRBRACKET) :: r493 in
  let r495 = [R 542] in
  let r496 = S (T T_RBRACKET) :: r495 in
  let r497 = [R 548] in
  let r498 = S (T T_GREATERRBRACE) :: r497 in
  let r499 = [R 216] in
  let r500 = S (N N_expr) :: r499 in
  let r501 = [R 440] in
  let r502 = S (N N_lbl_expr_list) :: r501 in
  let r503 = [R 537] in
  let r504 = [R 713] in
  let r505 = [R 534] in
  let r506 = S (T T_RBRACKET) :: r505 in
  let r507 = [R 535] in
  let r508 = S (T T_RBRACE) :: r507 in
  let r509 = [R 244] in
  let r510 = [R 245] in
  let r511 = [R 242] in
  let r512 = [R 520] in
  let r513 = [R 203] in
  let r514 = [R 532] in
  let r515 = [R 167] in
  let r516 = S (T T_DONE) :: r515 in
  let r517 = S (N N_seq_expr) :: r516 in
  let r518 = S (T T_DO) :: r517 in
  let r519 = S (N N_seq_expr) :: r518 in
  let r520 = [R 149] in
  let r521 = S (T T_DONE) :: r520 in
  let r522 = S (N N_seq_expr) :: r521 in
  let r523 = [R 148] in
  let r524 = S (T T_DONE) :: r523 in
  let r525 = S (N N_seq_expr) :: r524 in
  let r526 = S (T T_DO) :: r525 in
  let r527 = S (N N_seq_expr) :: r526 in
  let r528 = [R 222] in
  let r529 = Sub (r221) :: r528 in
  let r530 = [R 221] in
  let r531 = [R 157] in
  let r532 = [R 289] in
  let r533 = S (N N_seq_expr) :: r532 in
  let r534 = [R 528] in
  let r535 = [R 517] in
  let r536 = [R 546] in
  let r537 = S (T T_GREATERRBRACE) :: r536 in
  let r538 = [R 154] in
  let r539 = S (N N_seq_expr) :: r538 in
  let r540 = S (T T_IN) :: r539 in
  let r541 = S (N N_module_binding_body) :: r540 in
  let r542 = [R 306] in
  let r543 = [R 307] in
  let r544 = S (N N_module_expr) :: r543 in
  let r545 = S (T T_EQUAL) :: r544 in
  let r546 = [R 308] in
  let r547 = [R 152] in
  let r548 = S (N N_seq_expr) :: r547 in
  let r549 = S (T T_IN) :: r548 in
  let r550 = S (N N_let_bindings_no_attrs) :: r549 in
  let r551 = [R 633] in
  let r552 = S (N N_fun_binding) :: r551 in
  let r553 = [R 631] in
  let r554 = S (N N_seq_expr) :: r553 in
  let r555 = [R 681] in
  let r556 = [R 679] in
  let r557 = [R 219] in
  let r558 = S (N N_seq_expr) :: r557 in
  let r559 = [R 632] in
  let r560 = [R 276] in
  let r561 = S (N N_seq_expr) :: r560 in
  let r562 = S (T T_EQUAL) :: r561 in
  let r563 = S (N N_core_type) :: r562 in
  let r564 = [R 275] in
  let r565 = S (N N_seq_expr) :: r564 in
  let r566 = [R 324] in
  let r567 = [R 322] in
  let r568 = [R 323] in
  let r569 = [R 319] in
  let r570 = [R 551] in
  let r571 = [R 552] in
  let r572 = [R 169] in
  let r573 = S (T T_RPAREN) :: r572 in
  let r574 = S (N N_expr) :: r573 in
  let r575 = [R 530] in
  let r576 = [R 717] in
  let r577 = S (N N_seq_expr) :: r576 in
  let r578 = S (T T_PRIVATE) :: r139 in
  let r579 = R 389 :: r578 in
  let r580 = [R 27] in
  let r581 = S (N N_post_item_attributes) :: r580 in
  let r582 = [R 296] in
  let r583 = S (N N_poly_type) :: r582 in
  let r584 = S (T T_COLON) :: r583 in
  let r585 = [R 295] in
  let r586 = S (N N_poly_type) :: r585 in
  let r587 = S (T T_EQUAL) :: r554 in
  let r588 = [R 297] in
  let r589 = Sub (r587) :: r588 in
  let r590 = [R 298] in
  let r591 = S (N N_seq_expr) :: r590 in
  let r592 = S (T T_EQUAL) :: r591 in
  let r593 = [R 299] in
  let r594 = S (N N_seq_expr) :: r593 in
  let r595 = S (T T_EQUAL) :: r594 in
  let r596 = S (N N_core_type) :: r595 in
  let r597 = [R 29] in
  let r598 = S (N N_post_item_attributes) :: r597 in
  let r599 = [R 61] in
  let r600 = S (N N_class_longident) :: r599 in
  let r601 = [R 19] in
  let r602 = Sub (r600) :: r601 in
  let r603 = [R 25] in
  let r604 = S (N N_post_item_attributes) :: r603 in
  let r605 = R 397 :: r604 in
  let r606 = Sub (r602) :: r605 in
  let r607 = [R 62] in
  let r608 = S (T T_END) :: r607 in
  let r609 = [R 64] in
  let r610 = S (T T_RPAREN) :: r609 in
  let r611 = [R 22] in
  let r612 = Sub (r602) :: r611 in
  let r613 = S (T T_IN) :: r612 in
  let r614 = S (N N_let_bindings_no_attrs) :: r613 in
  let r615 = [R 60] in
  let r616 = S (N N_class_longident) :: r615 in
  let r617 = S (T T_RBRACKET) :: r616 in
  let r618 = S (N N_simple_pattern) :: r233 in
  let r619 = [R 37] in
  let r620 = Sub (r602) :: r619 in
  let r621 = S (T T_MINUSGREATER) :: r620 in
  let r622 = Sub (r618) :: r621 in
  let r623 = [R 20] in
  let r624 = [R 63] in
  let r625 = [R 396] in
  let r626 = [R 28] in
  let r627 = S (N N_post_item_attributes) :: r626 in
  let r628 = [R 30] in
  let r629 = [R 538] in
  let r630 = S (T T_BARRBRACKET) :: r629 in
  let r631 = [R 144] in
  let r632 = [R 652] in
  let r633 = [R 639] in
  let r634 = [R 626] in
  let r635 = Sub (r297) :: r634 in
  let r636 = [R 630] in
  let r637 = S (N N_post_item_attributes) :: r636 in
  let r638 = Sub (r635) :: r637 in
  let r639 = R 372 :: r638 in
  let r640 = R 429 :: r639 in
  let r641 = [R 213] in
  let r642 = S (N N_attributes) :: r641 in
  let r643 = S (N N_constr_longident) :: r642 in
  let r644 = [R 673] in
  let r645 = S (N N_val_ident) :: r504 in
  let r646 = [R 666] in
  let r647 = [R 644] in
  let r648 = S (N N_seq_expr) :: r647 in
  let r649 = S (T T_EQUAL) :: r648 in
  let r650 = [R 645] in
  let r651 = S (N N_module_expr) :: r650 in
  let r652 = S (T T_EQUAL) :: r651 in
  let r653 = [R 643] in
  let r654 = S (N N_seq_expr) :: r653 in
  let r655 = S (T T_EQUAL) :: r654 in
  let r656 = [R 649] in
  let r657 = S (N N_module_expr) :: r656 in
  let r658 = S (T T_EQUAL) :: r657 in
  let r659 = [R 648] in
  let r660 = S (N N_seq_expr) :: r659 in
  let r661 = S (T T_EQUAL) :: r660 in
  let r662 = S (N N_simple_expr) :: r661 in
  let r663 = S (N N_val_ident) :: r662 in
  let r664 = [R 647] in
  let r665 = S (N N_seq_expr) :: r664 in
  let r666 = S (T T_EQUAL) :: r665 in
  let r667 = [R 646] in
  let r668 = S (N N_seq_expr) :: r667 in
  let r669 = S (T T_EQUAL) :: r668 in
  let r670 = [R 655] in
  let r671 = [R 305] in
  let r672 = S (N N_post_item_attributes) :: r671 in
  let r673 = [R 657] in
  let r674 = [R 658] in
  let r675 = [R 656] in
  let r676 = [R 638] in
  let r677 = S (N N_let_bindings) :: r676 in
  let r678 = S (N N_rec_flag) :: r677 in
  let r679 = S (N N_ext_attributes) :: r678 in
  let r680 = [R 650] in
  let r681 = S (N N_let_bindings) :: r680 in
  let r682 = S (N N_rec_flag) :: r681 in
  let r683 = S (N N_ext_attributes) :: r682 in
  let r684 = [R 662] in
  let r685 = S (N N_post_item_attributes) :: r684 in
  let r686 = [R 651] in
  let r687 = S (N N_post_item_attributes) :: r686 in
  let r688 = S (N N_primitive_declaration) :: r687 in
  let r689 = S (T T_EQUAL) :: r688 in
  let r690 = S (N N_core_type) :: r689 in
  let r691 = S (T T_COLON) :: r690 in
  let r692 = [R 624] in
  let r693 = S (N N_post_item_attributes) :: r692 in
  let r694 = Sub (r297) :: r693 in
  let r695 = [R 654] in
  let r696 = [R 625] in
  let r697 = [R 660] in
  let r698 = [R 661] in
  let r699 = [R 34] in
  let r700 = Sub (r602) :: r699 in
  let r701 = S (T T_EQUAL) :: r700 in
  let r702 = [R 13] in
  let r703 = S (N N_post_item_attributes) :: r702 in
  let r704 = Sub (r701) :: r703 in
  let r705 = S (T T_LIDENT) :: r704 in
  let r706 = [R 35] in
  let r707 = Sub (r602) :: r706 in
  let r708 = S (T T_EQUAL) :: r707 in
  let r709 = [R 36] in
  let r710 = [R 667] in
  let r711 = [R 663] in
  let r712 = [R 636] in
  let r713 = S (N N_structure_tail) :: r712 in
  let r714 = [R 235] in
  let r715 = [R 236] in
  let r716 = [R 398] in
  function
  | 0 | 22 | 1552 | 1556 -> Nothing
  | 21 -> One ([R 0])
  | 1551 -> One ([R 1])
  | 1555 -> One ([R 2])
  | 1559 -> One ([R 3])
  | 401 -> One ([R 4])
  | 400 -> One ([R 5])
  | 211 -> One ([R 6])
  | 76 -> One ([R 8])
  | 78 -> One ([R 9])
  | 1529 -> One ([R 14])
  | 1530 -> One ([R 15])
  | 909 -> One ([R 17])
  | 910 -> One ([R 18])
  | 1346 -> One ([R 21])
  | 1349 -> One ([R 23])
  | 1344 -> One ([R 24])
  | 1368 -> One ([R 31])
  | 1369 -> One ([R 33])
  | 1350 -> One ([R 38])
  | 142 -> One ([R 39])
  | 865 -> One ([R 52])
  | 866 -> One ([R 54])
  | 856 -> One ([R 58])
  | 852 -> One ([R 59])
  | 871 -> One ([R 72])
  | 872 -> One ([R 73])
  | 844 -> One ([R 76])
  | 306 -> One ([R 78])
  | 316 -> One ([R 79])
  | 86 -> One ([R 80])
  | 313 -> One ([R 81])
  | 305 -> One ([R 82])
  | 304 -> One ([R 83])
  | 105 -> One ([R 84])
  | 582 | 592 -> One ([R 85])
  | 587 -> One ([R 88])
  | 583 -> One ([R 89])
  | 332 -> One ([R 90])
  | 314 -> One ([R 93])
  | 85 -> One ([R 94])
  | 652 -> One ([R 97])
  | 617 -> One ([R 100])
  | 594 -> One ([R 101])
  | 241 -> One ([R 102])
  | 243 -> One ([R 103])
  | 203 -> One ([R 104])
  | 214 -> One ([R 108])
  | 271 -> One ([R 109])
  | 206 -> One ([R 111])
  | 210 -> One ([R 112])
  | 600 -> One ([R 113])
  | 212 -> One ([R 115])
  | 217 -> One ([R 116])
  | 1127 -> One ([R 117])
  | 1128 -> One ([R 118])
  | 3 -> One ([R 119])
  | 19 -> One ([R 120])
  | 12 -> One ([R 121])
  | 20 -> One ([R 122])
  | 16 -> One ([R 123])
  | 14 -> One ([R 124])
  | 2 -> One ([R 125])
  | 13 -> One ([R 126])
  | 18 -> One ([R 127])
  | 17 -> One ([R 128])
  | 1 -> One ([R 129])
  | 15 -> One ([R 130])
  | 4 -> One ([R 131])
  | 7 -> One ([R 132])
  | 5 -> One ([R 133])
  | 6 -> One ([R 134])
  | 11 -> One ([R 135])
  | 10 -> One ([R 136])
  | 9 -> One ([R 137])
  | 8 -> One ([R 138])
  | 1087 -> One ([R 139])
  | 1084 -> One ([R 140])
  | 1386 -> One ([R 145])
  | 1384 -> One ([R 146])
  | 946 -> One ([R 150])
  | 1113 -> One ([R 151])
  | 973 -> One ([R 161])
  | 982 -> One ([R 162])
  | 953 -> One ([R 163])
  | 1169 -> One ([R 164])
  | 1112 -> One ([R 192])
  | 1099 -> One ([R 193])
  | 1104 -> One ([R 194])
  | 1109 -> One ([R 195])
  | 980 -> One ([R 200])
  | 975 -> One ([R 201])
  | 1123 -> One ([R 204])
  | 1047 -> One ([R 206])
  | 1044 -> One ([R 207])
  | 1231 -> One ([R 218])
  | 546 -> One ([R 225])
  | 545 -> One ([R 226])
  | 738 -> One ([R 227])
  | 739 -> One ([R 228])
  | 148 | 160 -> One ([R 233])
  | 127 -> One ([R 234])
  | 166 | 714 -> One ([R 238])
  | 631 -> One ([R 240])
  | 628 -> One ([R 241])
  | 948 -> One ([R 246])
  | 464 -> One ([R 247])
  | 466 -> One ([R 248])
  | 133 -> One ([R 249])
  | 463 -> One ([R 251])
  | 1114 -> One ([R 252])
  | 1116 -> One ([R 253])
  | 1069 -> One ([R 262])
  | 1067 -> One ([R 263])
  | 1064 -> One ([R 264])
  | 1066 -> One ([R 265])
  | 364 -> One ([R 267])
  | 300 -> One ([R 268])
  | 294 -> One ([R 269])
  | 295 -> One ([R 270])
  | 298 -> One ([R 271])
  | 299 -> One ([R 272])
  | 1041 -> One ([R 279])
  | 1211 -> One ([R 281])
  | 474 -> One ([R 282])
  | 962 -> One ([R 283])
  | 509 -> One ([R 284])
  | 511 -> One ([R 285])
  | 1237 -> One ([R 286])
  | 1238 -> One ([R 287])
  | 1164 -> One ([R 290])
  | 1163 -> One ([R 291])
  | 259 -> One ([R 292])
  | 168 -> One ([R 294])
  | 88 | 126 -> One ([R 300])
  | 96 -> One ([R 301])
  | 84 -> One ([R 303])
  | 136 -> One ([R 304])
  | 1483 -> One ([R 309])
  | 1482 -> One ([R 310])
  | 693 -> One ([R 314])
  | 692 -> One ([R 325])
  | 694 -> One ([R 326])
  | 699 -> One ([R 328])
  | 737 -> One ([R 334])
  | 736 -> One ([R 335])
  | 162 -> One ([R 336])
  | 415 -> One (R 338 :: r147)
  | 814 -> One (R 338 :: r398)
  | 416 -> One ([R 339])
  | 240 -> One ([R 341])
  | 239 -> One ([R 342])
  | 339 | 932 -> One ([R 345])
  | 116 | 398 -> One ([R 346])
  | 311 -> One ([R 347])
  | 310 -> One ([R 348])
  | 309 -> One ([R 349])
  | 308 -> One ([R 350])
  | 307 -> One ([R 351])
  | 286 | 931 -> One ([R 352])
  | 114 -> One ([R 353])
  | 342 | 937 -> One ([R 354])
  | 119 | 356 | 448 -> One ([R 355])
  | 118 | 447 -> One ([R 356])
  | 284 | 357 | 930 -> One ([R 357])
  | 283 | 929 -> One ([R 358])
  | 113 -> One ([R 359])
  | 338 -> One ([R 360])
  | 287 -> One ([R 361])
  | 312 -> One ([R 362])
  | 121 -> One ([R 363])
  | 341 -> One ([R 364])
  | 343 -> One ([R 365])
  | 344 -> One ([R 366])
  | 340 -> One ([R 367])
  | 117 -> One ([R 368])
  | 120 -> One ([R 369])
  | 201 -> One ([R 370])
  | 178 -> One (R 372 :: r63)
  | 638 -> One (R 372 :: r288)
  | 179 -> One ([R 373])
  | 472 -> One (R 374 :: r183)
  | 512 -> One (R 374 :: r229)
  | 257 -> One (R 376 :: r84)
  | 372 -> One (R 376 :: r107)
  | 626 -> One (R 376 :: r286)
  | 640 -> One (R 376 :: r290)
  | 1042 -> One (R 376 :: r494)
  | 1049 -> One (R 376 :: r496)
  | 1053 -> One (R 376 :: r498)
  | 1185 -> One (R 376 :: r537)
  | 1371 -> One (R 376 :: r630)
  | 258 | 297 | 366 | 627 | 1043 | 1054 -> One ([R 377])
  | 1438 -> One (R 378 :: r649)
  | 1443 -> One (R 378 :: r652)
  | 1447 -> One (R 378 :: r655)
  | 1439 -> One ([R 379])
  | 570 -> One ([R 381])
  | 654 -> One ([R 384])
  | 562 -> One ([R 387])
  | 421 -> One ([R 388])
  | 675 -> One (R 389 :: r308)
  | 1327 -> One (R 389 :: r606)
  | 422 -> One ([R 390])
  | 130 -> One ([R 391])
  | 279 -> One ([R 392])
  | 280 -> One ([R 394])
  | 282 -> One ([R 395])
  | 319 -> One ([R 399])
  | 324 -> One ([R 401])
  | 329 -> One ([R 409])
  | 326 -> One ([R 410])
  | 370 -> One ([R 412])
  | 367 -> One ([R 413])
  | 515 -> One ([R 414])
  | 246 -> One ([R 416])
  | 1391 -> One ([R 419])
  | 842 -> One ([R 420])
  | 256 -> One ([R 422])
  | 785 -> One ([R 427])
  | 786 -> One ([R 428])
  | 636 -> One ([R 430])
  | 829 -> One (R 431 :: r407)
  | 832 -> One ([R 432])
  | 830 -> One ([R 433])
  | 833 -> One ([R 434])
  | 831 -> One ([R 435])
  | 458 -> One ([R 437])
  | 768 -> One ([R 438])
  | 767 -> One ([R 439])
  | 1076 -> One ([R 441])
  | 189 -> One ([R 442])
  | 194 | 890 -> One ([R 443])
  | 225 -> One ([R 444])
  | 198 -> One ([R 445])
  | 1028 -> One ([R 446])
  | 1029 -> One ([R 447])
  | 1030 -> One ([R 448])
  | 668 -> One ([R 451])
  | 658 -> One ([R 457])
  | 576 -> One ([R 458])
  | 792 -> One ([R 459])
  | 659 -> One ([R 463])
  | 765 -> One ([R 467])
  | 913 -> One ([R 470])
  | 916 -> One ([R 475])
  | 323 -> One ([R 476])
  | 111 -> One ([R 478])
  | 109 -> One ([R 479])
  | 108 -> One ([R 480])
  | 107 -> One ([R 481])
  | 104 -> One ([R 483])
  | 102 -> One ([R 484])
  | 101 -> One ([R 485])
  | 100 -> One ([R 486])
  | 190 -> One ([R 487])
  | 140 -> One ([R 490])
  | 188 -> One ([R 491])
  | 193 -> One ([R 492])
  | 268 -> One ([R 493])
  | 192 -> One ([R 497])
  | 267 -> One ([R 498])
  | 207 | 899 -> One ([R 507])
  | 601 | 614 -> One ([R 508])
  | 204 -> One ([R 510])
  | 208 -> One ([R 511])
  | 893 -> One ([R 512])
  | 895 -> One ([R 513])
  | 391 -> One ([R 515])
  | 944 -> One ([R 519])
  | 535 -> One ([R 521])
  | 936 -> One ([R 522])
  | 935 | 981 -> One ([R 523])
  | 538 | 952 -> One ([R 524])
  | 934 -> One ([R 554])
  | 1117 -> One ([R 555])
  | 1115 -> One ([R 556])
  | 317 -> One ([R 557])
  | 318 -> One ([R 558])
  | 83 -> One ([R 559])
  | 320 -> One ([R 560])
  | 322 -> One ([R 561])
  | 363 -> One ([R 562])
  | 362 -> One ([R 563])
  | 334 -> One ([R 573])
  | 50 -> One ([R 574])
  | 31 -> One ([R 575])
  | 75 -> One ([R 576])
  | 74 -> One ([R 577])
  | 73 -> One ([R 578])
  | 72 -> One ([R 579])
  | 71 -> One ([R 580])
  | 70 -> One ([R 581])
  | 69 -> One ([R 582])
  | 68 -> One ([R 583])
  | 67 -> One ([R 584])
  | 66 -> One ([R 585])
  | 65 -> One ([R 586])
  | 64 -> One ([R 587])
  | 63 -> One ([R 588])
  | 62 -> One ([R 589])
  | 61 -> One ([R 590])
  | 60 -> One ([R 591])
  | 59 -> One ([R 592])
  | 58 -> One ([R 593])
  | 57 -> One ([R 594])
  | 56 -> One ([R 595])
  | 55 -> One ([R 596])
  | 54 -> One ([R 597])
  | 53 -> One ([R 598])
  | 52 -> One ([R 599])
  | 51 -> One ([R 600])
  | 49 -> One ([R 601])
  | 48 -> One ([R 602])
  | 47 -> One ([R 603])
  | 46 -> One ([R 604])
  | 45 -> One ([R 605])
  | 44 -> One ([R 606])
  | 43 -> One ([R 607])
  | 42 -> One ([R 608])
  | 41 -> One ([R 609])
  | 40 -> One ([R 610])
  | 39 -> One ([R 611])
  | 38 -> One ([R 612])
  | 37 -> One ([R 613])
  | 36 -> One ([R 614])
  | 35 -> One ([R 615])
  | 34 -> One ([R 616])
  | 33 -> One ([R 617])
  | 32 -> One ([R 618])
  | 30 -> One ([R 619])
  | 29 -> One ([R 620])
  | 28 -> One ([R 621])
  | 27 -> One ([R 622])
  | 26 -> One ([R 623])
  | 1425 -> One ([R 627])
  | 1417 -> One ([R 628])
  | 1416 -> One ([R 629])
  | 244 -> One ([R 634])
  | 245 -> One ([R 635])
  | 1407 -> One ([R 640])
  | 1404 -> One ([R 641])
  | 1506 -> One ([R 642])
  | 1408 -> One ([R 653])
  | 1542 -> One ([R 659])
  | 1545 -> One ([R 664])
  | 441 -> One ([R 668])
  | 440 -> One ([R 669])
  | 1430 -> One ([R 674])
  | 1431 -> One ([R 675])
  | 1433 -> One ([R 676])
  | 1432 -> One ([R 677])
  | 1429 -> One ([R 678])
  | 1227 -> One ([R 680])
  | 655 -> One ([R 683])
  | 578 -> One ([R 684])
  | 645 -> One ([R 688])
  | 590 -> One ([R 689])
  | 618 -> One ([R 694])
  | 637 -> One ([R 695])
  | 89 -> One ([R 696])
  | 712 -> One ([R 699])
  | 724 -> One ([R 702])
  | 557 -> One ([R 706])
  | 559 -> One ([R 707])
  | 285 | 488 | 1074 -> One ([R 710])
  | 536 -> One ([R 712])
  | 819 -> One (R 721 :: r402)
  | 796 -> One ([R 722])
  | 728 -> One ([R 726])
  | 735 -> One ([R 727])
  | 734 -> One ([R 728])
  | 575 -> One ([R 729])
  | 573 -> One ([R 730])
  | 716 -> One ([R 731])
  | 717 -> One ([R 732])
  | 1061 -> One (S (T T_WITH) :: r502)
  | 1193 -> One (S (T T_UIDENT) :: r541)
  | 679 -> One (S (T T_TYPE) :: r311)
  | 684 -> One (S (T T_TYPE) :: r322)
  | 1451 -> One (S (T T_STRING) :: r658)
  | 1455 -> One (S (T T_STRING) :: r663)
  | 1461 -> One (S (T T_STRING) :: r666)
  | 1465 -> One (S (T T_STRING) :: r669)
  | 603 -> One (S (T T_STAR) :: r275)
  | 1420 -> One (S (T T_RPAREN) :: r24)
  | 123 -> One (S (T T_RPAREN) :: r25)
  | 128 -> One (S (T T_RPAREN) :: r26)
  | 350 -> One (S (T T_RPAREN) :: r101)
  | 408 -> One (S (T T_RPAREN) :: r138)
  | 467 -> One (S (T T_RPAREN) :: r180)
  | 519 -> One (S (T T_RPAREN) :: r231)
  | 544 -> One (S (T T_RPAREN) :: r242)
  | 585 | 593 -> One (S (T T_RPAREN) :: r266)
  | 681 -> One (S (T T_RPAREN) :: r315)
  | 688 -> One (S (T T_RPAREN) :: r323)
  | 690 -> One (S (T T_RPAREN) :: r324)
  | 1119 -> One (S (T T_RPAREN) :: r512)
  | 1124 -> One (S (T T_RPAREN) :: r514)
  | 1148 -> One (S (T T_RPAREN) :: r529)
  | 1180 -> One (S (T T_RPAREN) :: r535)
  | 1218 -> One (S (T T_RPAREN) :: r552)
  | 1256 -> One (S (T T_RPAREN) :: r566)
  | 1259 -> One (S (T T_RPAREN) :: r567)
  | 1262 -> One (S (T T_RPAREN) :: r568)
  | 1267 -> One (S (T T_RPAREN) :: r569)
  | 1269 -> One (S (T T_RPAREN) :: r570)
  | 1272 -> One (S (T T_RPAREN) :: r571)
  | 1283 -> One (S (T T_RPAREN) :: r575)
  | 1356 -> One (S (T T_RPAREN) :: r624)
  | 181 -> One (S (T T_RBRACKET) :: r64)
  | 226 -> One (S (T T_RBRACKET) :: r76)
  | 237 -> One (S (T T_RBRACKET) :: r80)
  | 1421 -> One (S (T T_RBRACKET) :: r92)
  | 1070 -> One (S (T T_RBRACE) :: r503)
  | 662 -> One (S (T T_PLUSEQ) :: r304)
  | 1410 -> One (S (T T_PLUSEQ) :: r640)
  | 475 -> One (S (T T_OPEN) :: r188)
  | 261 -> One (S (T T_MINUSGREATER) :: r86)
  | 502 -> One (S (T T_MINUSGREATER) :: r218)
  | 608 -> One (S (T T_MINUSGREATER) :: r278)
  | 887 -> One (S (T T_MINUSGREATER) :: r440)
  | 891 -> One (S (T T_MINUSGREATER) :: r442)
  | 1156 -> One (S (T T_MINUSGREATER) :: r533)
  | 150 -> One (S (T T_LIDENT) :: r40)
  | 877 -> One (S (T T_LIDENT) :: r435)
  | 1359 -> One (S (T T_LIDENT) :: r625)
  | 971 -> One (S (T T_LESSMINUS) :: r464)
  | 99 -> One (S (T T_INT) :: r19)
  | 106 -> One (S (T T_INT) :: r20)
  | 483 -> One (S (T T_GREATERRBRACE) :: r194)
  | 165 -> One (S (T T_GREATER) :: r51)
  | 169 -> One (S (T T_GREATER) :: r52)
  | 485 -> One (S (T T_EQUAL) :: r196)
  | 649 -> One (S (T T_EQUAL) :: r292)
  | 968 -> One (S (T T_EQUAL) :: r462)
  | 1031 -> One (S (T T_EQUAL) :: r490)
  | 1055 -> One (S (T T_EQUAL) :: r500)
  | 1228 -> One (S (T T_EQUAL) :: r558)
  | 1246 -> One (S (T T_EQUAL) :: r565)
  | 1294 -> One (S (T T_EQUAL) :: r577)
  | 1549 -> One (S (T T_EOF) :: r714)
  | 1553 -> One (S (T T_EOF) :: r715)
  | 1557 -> One (S (T T_EOF) :: r716)
  | 1171 -> One (S (T T_END) :: r534)
  | 134 -> One (S (T T_DOT) :: r31)
  | 143 -> One (S (T T_DOT) :: r34)
  | 158 -> One (S (T T_DOT) :: r49)
  | 249 -> One (S (T T_DOT) :: r82)
  | 837 -> One (S (T T_DOT) :: r409)
  | 848 -> One (S (T T_DOT) :: r416)
  | 1239 -> One (S (T T_DOT) :: r563)
  | 1313 -> One (S (T T_DOT) :: r596)
  | 1434 -> One (S (T T_DOT) :: r645)
  | 1134 -> One (S (T T_DO) :: r522)
  | 378 -> One (S (T T_COMMA) :: r110)
  | 1277 -> One (S (T T_COMMA) :: r574)
  | 726 -> One (S (T T_COLONEQUAL) :: r8)
  | 171 -> One (S (T T_COLON) :: r55)
  | 434 -> One (S (T T_COLON) :: r153)
  | 548 -> One (S (T T_COLON) :: r245)
  | 682 -> One (S (T T_COLON) :: r319)
  | 761 -> One (S (T T_COLON) :: r352)
  | 925 -> One (S (T T_COLON) :: r447)
  | 1306 -> One (S (T T_COLON) :: r586)
  | 288 -> One (S (T T_BARRBRACKET) :: r88)
  | 399 -> One (S (T T_BARRBRACKET) :: r129)
  | 184 | 889 -> One (S (T T_BAR) :: r69)
  | 228 -> One (S (T T_BAR) :: r79)
  | 619 -> One (S (T T_BAR) :: r280)
  | 715 -> One (S (N N_with_type_binder) :: r342)
  | 701 -> One (S (N N_with_constraints) :: r330)
  | 354 -> One (S (N N_val_ident) :: r103)
  | 551 -> One (S (N N_val_ident) :: r251)
  | 780 -> One (S (N N_val_ident) :: r366)
  | 1496 -> One (S (N N_val_ident) :: r691)
  | 704 -> One (S (N N_type_variable) :: r337)
  | 702 -> One (S (N N_type_parameters) :: r334)
  | 703 -> One (S (N N_type_parameter_list) :: r336)
  | 799 -> One (S (N N_type_parameter_list) :: r381)
  | 710 -> One (S (N N_type_parameter) :: r339)
  | 87 -> One (S (N N_type_longident) :: r13)
  | 556 -> One (S (N N_type_declarations) :: r252)
  | 558 -> One (S (N N_type_declarations) :: r253)
  | 1400 -> One (S (N N_type_declarations) :: r632)
  | 1401 -> One (S (N N_type_declarations) :: r633)
  | 23 -> One (S (N N_structure_tail) :: r0)
  | 1532 -> One (S (N N_structure_tail) :: r710)
  | 1436 -> One (S (N N_structure_head) :: r646)
  | 450 -> One (S (N N_structure) :: r168)
  | 302 -> One (S (N N_simple_pattern) :: r95)
  | 521 -> One (S (N N_simple_pattern) :: r232)
  | 390 -> One (S (N N_simple_expr) :: r123)
  | 489 -> One (S (N N_simple_expr) :: r201)
  | 490 -> One (S (N N_simple_expr) :: r202)
  | 494 -> One (S (N N_simple_expr) :: r207)
  | 534 -> One (S (N N_simple_expr) :: r237)
  | 954 -> One (S (N N_simple_expr) :: r453)
  | 1090 -> One (S (N N_simple_expr) :: r510)
  | 1092 -> One (S (N N_simple_expr) :: r511)
  | 882 -> One (S (N N_simple_core_type_or_tuple_no_attr) :: r438)
  | 606 -> One (S (N N_simple_core_type_no_attr) :: r276)
  | 550 -> One (S (N N_signature) :: r247)
  | 674 -> One (S (N N_signature) :: r305)
  | 911 -> One (S (N N_signature) :: r443)
  | 397 -> One (S (N N_seq_expr) :: r128)
  | 473 -> One (S (N N_seq_expr) :: r184)
  | 1324 -> One (S (N N_seq_expr) :: r598)
  | 183 -> One (S (N N_row_field_list) :: r66)
  | 487 -> One (S (N N_record_expr) :: r198)
  | 1206 -> One (S (N N_rec_flag) :: r550)
  | 1333 -> One (S (N N_rec_flag) :: r614)
  | 429 -> One (S (N N_post_item_attributes) :: r151)
  | 757 -> One (S (N N_post_item_attributes) :: r349)
  | 863 -> One (S (N N_post_item_attributes) :: r423)
  | 914 -> One (S (N N_post_item_attributes) :: r444)
  | 1038 -> One (S (N N_post_item_attributes) :: r492)
  | 1366 -> One (S (N N_post_item_attributes) :: r628)
  | 1474 -> One (S (N N_post_item_attributes) :: r673)
  | 1476 -> One (S (N N_post_item_attributes) :: r674)
  | 1507 -> One (S (N N_post_item_attributes) :: r696)
  | 1543 -> One (S (N N_post_item_attributes) :: r711)
  | 1546 -> One (S (N N_post_item_attributes) :: r713)
  | 1311 -> One (S (N N_poly_type) :: r592)
  | 289 -> One (S (N N_pattern_semi_list) :: r91)
  | 82 -> One (S (N N_pattern) :: r12)
  | 303 -> One (S (N N_pattern) :: r22)
  | 315 -> One (S (N N_pattern) :: r96)
  | 327 -> One (S (N N_pattern) :: r97)
  | 347 -> One (S (N N_pattern) :: r100)
  | 352 -> One (S (N N_pattern) :: r102)
  | 404 -> One (S (N N_pattern) :: r137)
  | 155 -> One (S (N N_package_type) :: r47)
  | 561 -> One (S (N N_optional_type_variable) :: r256)
  | 560 -> One (S (N N_optional_type_parameter_list) :: r255)
  | 568 -> One (S (N N_optional_type_parameter) :: r258)
  | 355 -> One (S (N N_operator) :: r105)
  | 695 -> One (S (N N_module_type) :: r326)
  | 744 -> One (S (N N_module_type) :: r346)
  | 777 -> One (S (N N_module_type) :: r360)
  | 1197 -> One (S (N N_module_type) :: r545)
  | 453 -> One (S (N N_module_expr) :: r170)
  | 1195 -> One (S (N N_module_expr) :: r542)
  | 1493 -> One (S (N N_module_expr) :: r685)
  | 680 -> One (S (N N_module_declaration) :: r313)
  | 1479 -> One (S (N N_module_bindings) :: r675)
  | 1204 -> One (S (N N_module_binding_body) :: r546)
  | 1470 -> One (S (N N_module_binding_body) :: r672)
  | 1469 -> One (S (N N_module_binding) :: r670)
  | 725 -> One (S (N N_mod_longident) :: r345)
  | 749 -> One (S (N N_mod_longident) :: r348)
  | 92 -> One (S (N N_mod_ext_longident) :: r18)
  | 1381 -> One (S (N N_match_cases) :: r631)
  | 1037 -> One (S (N N_let_binding) :: r491)
  | 291 -> One (S (N N_lbl_pattern_list) :: r94)
  | 461 -> One (S (N N_label_var) :: r179)
  | 470 -> One (S (N N_label_var) :: r181)
  | 132 -> One (S (N N_label_longident) :: r29)
  | 956 -> One (S (N N_label_longident) :: r454)
  | 947 -> One (S (N N_label_ident) :: r452)
  | 1088 -> One (S (N N_label_ident) :: r509)
  | 437 -> One (S (N N_label) :: r156)
  | 621 -> One (S (N N_label) :: r284)
  | 941 -> One (S (N N_label) :: r450)
  | 983 -> One (S (N N_label) :: r467)
  | 1300 -> One (S (N N_label) :: r584)
  | 1309 -> One (S (N N_label) :: r589)
  | 147 -> One (S (N N_ident) :: r35)
  | 173 -> One (S (N N_ident) :: r56)
  | 186 -> One (S (N N_ident) :: r70)
  | 250 -> One (S (N N_ident) :: r83)
  | 563 -> One (S (N N_ident) :: r257)
  | 705 -> One (S (N N_ident) :: r338)
  | 1427 -> One (S (N N_ident) :: r644)
  | 595 -> One (S (N N_generalized_constructor_arguments) :: r269)
  | 543 -> One (S (N N_functor_args) :: r241)
  | 696 -> One (S (N N_functor_args) :: r329)
  | 460 -> One (S (N N_fun_binding) :: r178)
  | 1232 -> One (S (N N_fun_binding) :: r559)
  | 24 -> One (S (N N_ext_attributes) :: r5)
  | 384 -> One (S (N N_ext_attributes) :: r115)
  | 386 -> One (S (N N_ext_attributes) :: r117)
  | 388 -> One (S (N N_ext_attributes) :: r122)
  | 392 -> One (S (N N_ext_attributes) :: r125)
  | 402 -> One (S (N N_ext_attributes) :: r135)
  | 442 -> One (S (N N_ext_attributes) :: r161)
  | 444 -> One (S (N N_ext_attributes) :: r166)
  | 456 -> One (S (N N_ext_attributes) :: r177)
  | 477 -> One (S (N N_ext_attributes) :: r190)
  | 492 -> One (S (N N_ext_attributes) :: r206)
  | 495 -> One (S (N N_ext_attributes) :: r209)
  | 497 -> One (S (N N_ext_attributes) :: r213)
  | 499 -> One (S (N N_ext_attributes) :: r216)
  | 504 -> One (S (N N_ext_attributes) :: r224)
  | 938 -> One (S (N N_ext_attributes) :: r449)
  | 964 -> One (S (N N_ext_attributes) :: r460)
  | 454 -> One (S (N N_expr) :: r172)
  | 491 -> One (S (N N_expr) :: r204)
  | 945 -> One (S (N N_expr) :: r451)
  | 976 -> One (S (N N_expr) :: r465)
  | 978 -> One (S (N N_expr) :: r466)
  | 985 -> One (S (N N_expr) :: r468)
  | 987 -> One (S (N N_expr) :: r469)
  | 989 -> One (S (N N_expr) :: r470)
  | 991 -> One (S (N N_expr) :: r471)
  | 993 -> One (S (N N_expr) :: r472)
  | 995 -> One (S (N N_expr) :: r473)
  | 997 -> One (S (N N_expr) :: r474)
  | 999 -> One (S (N N_expr) :: r475)
  | 1001 -> One (S (N N_expr) :: r476)
  | 1003 -> One (S (N N_expr) :: r477)
  | 1005 -> One (S (N N_expr) :: r478)
  | 1007 -> One (S (N N_expr) :: r479)
  | 1009 -> One (S (N N_expr) :: r480)
  | 1011 -> One (S (N N_expr) :: r481)
  | 1013 -> One (S (N N_expr) :: r482)
  | 1015 -> One (S (N N_expr) :: r483)
  | 1017 -> One (S (N N_expr) :: r484)
  | 1019 -> One (S (N N_expr) :: r485)
  | 1021 -> One (S (N N_expr) :: r486)
  | 1024 -> One (S (N N_expr) :: r487)
  | 1026 -> One (S (N N_expr) :: r488)
  | 1121 -> One (S (N N_expr) :: r513)
  | 1126 -> One (S (N N_direction_flag) :: r519)
  | 1139 -> One (S (N N_direction_flag) :: r527)
  | 219 -> One (S (N N_core_type_no_attr) :: r74)
  | 596 -> One (S (N N_core_type_list_no_attr) :: r270)
  | 154 -> One (S (N N_core_type_comma_list) :: r45)
  | 845 -> One (S (N N_core_type_comma_list) :: r414)
  | 1337 -> One (S (N N_core_type_comma_list) :: r617)
  | 153 -> One (S (N N_core_type2) :: r43)
  | 177 -> One (S (N N_core_type) :: r60)
  | 269 -> One (S (N N_core_type) :: r87)
  | 581 -> One (S (N N_core_type) :: r264)
  | 584 -> One (S (N N_core_type) :: r265)
  | 806 -> One (S (N N_core_type) :: r388)
  | 1222 -> One (S (N N_core_type) :: r555)
  | 1224 -> One (S (N N_core_type) :: r556)
  | 798 -> One (S (N N_class_type_parameters) :: r379)
  | 873 -> One (S (N N_class_type_parameters) :: r430)
  | 1514 -> One (S (N N_class_type_parameters) :: r705)
  | 797 -> One (S (N N_class_type_declarations) :: r372)
  | 1512 -> One (S (N N_class_type_declarations) :: r698)
  | 141 -> One (S (N N_class_longident) :: r32)
  | 795 -> One (S (N N_class_descriptions) :: r371)
  | 1511 -> One (S (N N_class_declarations) :: r697)
  | 199 -> One (S (N N_attributes) :: r71)
  | 222 -> One (S (N N_attributes) :: r75)
  | 395 -> One (S (N N_attributes) :: r126)
  | 25 -> One (S (N N_attr_id) :: r7)
  | 80 -> One (S (N N_attr_id) :: r11)
  | 175 -> One (S (N N_attr_id) :: r59)
  | 424 -> One (S (N N_attr_id) :: r150)
  | 769 -> One (S (N N_attr_id) :: r355)
  | 773 -> One (S (N N_attr_id) :: r358)
  | 202 -> One (S (N N_amper_type_list) :: r73)
  | 1329 -> One (Sub (r132) :: r608)
  | 414 -> One (Sub (r141) :: r143)
  | 1150 -> One (Sub (r221) :: r530)
  | 1154 -> One (Sub (r221) :: r531)
  | 506 -> One (Sub (r226) :: r227)
  | 789 -> One (Sub (r369) :: r370)
  | 843 -> One (Sub (r374) :: r411)
  | 805 -> One (Sub (r384) :: r386)
  | 813 -> One (Sub (r392) :: r394)
  | 857 -> One (Sub (r420) :: r422)
  | 1363 -> One (Sub (r420) :: r627)
  | 1519 -> One (Sub (r425) :: r708)
  | 1297 -> One (Sub (r579) :: r581)
  | 1332 -> One (Sub (r602) :: r610)
  | 1341 -> One (Sub (r622) :: r623)
  | 1503 -> One (Sub (r694) :: r695)
  | 1523 -> One (Sub (r701) :: r709)
  | 1531 -> One (r0)
  | 1399 -> One (r1)
  | 1398 -> One (r2)
  | 1397 -> One (r3)
  | 1396 -> One (r4)
  | 1395 -> One (r5)
  | 1394 -> One (r6)
  | 79 -> One (r7)
  | 77 | 95 | 122 | 125 | 131 | 164 | 191 | 197 | 200 | 205 | 209 | 213 | 215 | 216 | 236 | 266 | 281 | 296 | 301 | 321 | 325 | 333 | 349 | 375 | 376 | 377 | 383 | 407 | 433 | 449 | 462 | 465 | 471 | 503 | 508 | 510 | 518 | 529 | 533 | 540 | 541 | 542 | 572 | 574 | 577 | 591 | 620 | 635 | 639 | 648 | 657 | 667 | 727 | 733 | 756 | 760 | 766 | 791 | 870 | 886 | 894 | 908 | 943 | 950 | 951 | 957 | 961 | 963 | 967 | 974 | 1048 | 1052 | 1060 | 1065 | 1068 | 1073 | 1077 | 1080 | 1086 | 1094 | 1095 | 1098 | 1100 | 1103 | 1105 | 1108 | 1111 | 1138 | 1147 | 1162 | 1168 | 1192 | 1217 | 1226 | 1235 | 1236 | 1245 | 1255 | 1258 | 1261 | 1266 | 1271 | 1274 | 1275 | 1276 | 1299 | 1305 | 1312 | 1355 | 1380 | 1383 | 1385 | 1403 | 1406 | 1415 | 1473 | 1475 | 1481 | 1505 | 1528 -> One (r8)
  | 1393 -> One (r9)
  | 1392 -> One (r10)
  | 81 -> One (r11)
  | 382 -> One (r12)
  | 90 -> One (r13)
  | 98 | 898 -> One (r14)
  | 97 | 897 -> One (r15)
  | 91 | 896 -> One (r16)
  | 94 -> One (r17)
  | 93 -> One (r18)
  | 103 -> One (r19)
  | 110 -> One (r20)
  | 346 -> One (r21)
  | 345 -> One (r22)
  | 115 -> One (r24)
  | 124 -> One (r25)
  | 129 -> One (r26)
  | 278 -> One (r27)
  | 139 -> One (r28)
  | 138 -> One (r29)
  | 137 -> One (r30)
  | 135 -> One (r31)
  | 146 -> One (r32)
  | 145 -> One (r33)
  | 144 -> One (r34)
  | 149 -> One (r35)
  | 277 -> One (r36)
  | 276 -> One (r37)
  | 275 -> One (r38)
  | 152 -> One (r39)
  | 151 -> One (r40)
  | 274 -> One (r41)
  | 273 -> One (r42)
  | 272 -> One (r43)
  | 265 -> One (r44)
  | 264 -> One (r45)
  | 157 -> One (r46)
  | 156 -> One (r47)
  | 161 -> One (r48)
  | 159 -> One (r49)
  | 885 | 966 -> One (r50)
  | 167 -> One (r51)
  | 170 -> One (r52)
  | 255 -> One (r53)
  | 254 -> One (r54)
  | 172 -> One (r55)
  | 174 -> One (r56)
  | 248 -> One (r57)
  | 247 -> One (r58)
  | 176 -> One (r59)
  | 242 -> One (r60)
  | 235 -> One (r61)
  | 234 -> One (r62)
  | 180 -> One (r63)
  | 182 -> One (r64)
  | 233 -> One (r65)
  | 232 -> One (r66)
  | 196 -> One (r67)
  | 195 -> One (r68)
  | 185 -> One (r69)
  | 187 -> One (r70)
  | 224 -> One (r71)
  | 221 -> One (r72)
  | 218 -> One (r73)
  | 220 -> One (r74)
  | 223 -> One (r75)
  | 227 -> One (r76)
  | 231 -> One (r77)
  | 230 -> One (r78)
  | 229 -> One (r79)
  | 238 -> One (r80)
  | 253 -> One (r81)
  | 252 -> One (r82)
  | 251 -> One (r83)
  | 260 -> One (r84)
  | 263 -> One (r85)
  | 262 -> One (r86)
  | 270 -> One (r87)
  | 371 -> One (r88)
  | 369 -> One (r89)
  | 368 -> One (r90)
  | 365 -> One (r91)
  | 290 -> One (r92)
  | 293 -> One (r93)
  | 292 -> One (r94)
  | 361 -> One (r95)
  | 337 -> One (r96)
  | 328 -> One (r97)
  | 331 -> One (r98)
  | 336 -> One (r99)
  | 348 -> One (r100)
  | 351 -> One (r101)
  | 353 -> One (r102)
  | 360 -> One (r103)
  | 359 -> One (r104)
  | 358 -> One (r105)
  | 374 -> One (r106)
  | 373 -> One (r107)
  | 381 -> One (r108)
  | 380 -> One (r109)
  | 379 -> One (r110)
  | 1390 -> One (r111)
  | 1389 -> One (r112)
  | 1388 -> One (r113)
  | 1387 -> One (r114)
  | 385 -> One (r115)
  | 1379 -> One (r116)
  | 387 -> One (r117)
  | 1378 -> One (r118)
  | 1377 -> One (r119)
  | 1376 -> One (r120)
  | 1375 -> One (r121)
  | 389 -> One (r122)
  | 1374 -> One (r123)
  | 394 -> One (r124)
  | 393 -> One (r125)
  | 396 -> One (r126)
  | 1282 -> One (r127)
  | 1281 -> One (r128)
  | 1370 -> One (r129)
  | 413 -> One (r130)
  | 412 -> One (r131)
  | 411 -> One (r133)
  | 410 -> One (r134)
  | 403 -> One (r135)
  | 406 -> One (r136)
  | 405 -> One (r137)
  | 409 -> One (r138)
  | 432 | 1304 -> One (r139)
  | 431 -> One (r140)
  | 428 -> One (r142)
  | 423 -> One (r143)
  | 420 -> One (r144)
  | 419 -> One (r145)
  | 418 -> One (r146)
  | 417 -> One (r147)
  | 427 -> One (r148)
  | 426 -> One (r149)
  | 425 -> One (r150)
  | 430 -> One (r151)
  | 436 -> One (r152)
  | 435 -> One (r153)
  | 1293 -> One (r154)
  | 439 -> One (r155)
  | 438 -> One (r156)
  | 1292 -> One (r157)
  | 1291 -> One (r158)
  | 1290 -> One (r159)
  | 1289 -> One (r160)
  | 443 -> One (r161)
  | 1288 -> One (r162)
  | 1287 -> One (r163)
  | 1286 -> One (r164)
  | 1285 -> One (r165)
  | 445 -> One (r166)
  | 452 -> One (r167)
  | 451 -> One (r168)
  | 1265 -> One (r169)
  | 1264 -> One (r170)
  | 1254 -> One (r171)
  | 1253 -> One (r172)
  | 1252 -> One (r173)
  | 1251 -> One (r174)
  | 1250 -> One (r175)
  | 459 -> One (r176)
  | 457 -> One (r177)
  | 1249 -> One (r178)
  | 469 -> One (r179)
  | 468 -> One (r180)
  | 1215 -> One (r181)
  | 1214 -> One (r182)
  | 1213 -> One (r183)
  | 1212 -> One (r184)
  | 1191 -> One (r185)
  | 481 -> One (r186)
  | 480 -> One (r187)
  | 476 -> One (r188)
  | 479 -> One (r189)
  | 478 -> One (r190)
  | 1190 -> One (r191)
  | 1189 -> One (r192)
  | 1188 -> One (r193)
  | 484 -> One (r194)
  | 1184 -> One (r195)
  | 486 -> One (r196)
  | 1183 -> One (r197)
  | 1182 -> One (r198)
  | 1179 -> One (r199)
  | 1178 -> One (r200)
  | 1177 -> One (r201)
  | 1176 -> One (r202)
  | 1175 -> One (r203)
  | 1174 -> One (r204)
  | 1173 -> One (r205)
  | 493 -> One (r206)
  | 933 -> One (r207)
  | 1170 -> One (r208)
  | 496 -> One (r209)
  | 1167 -> One (r210)
  | 1166 -> One (r211)
  | 1165 -> One (r212)
  | 498 -> One (r213)
  | 1161 -> One (r214)
  | 501 -> One (r215)
  | 500 -> One (r216)
  | 1160 -> One (r217)
  | 1159 -> One (r218)
  | 1145 -> One (r219)
  | 525 -> One (r220)
  | 1153 -> One (r222)
  | 524 -> One (r223)
  | 505 -> One (r224)
  | 507 -> One (r225)
  | 516 -> One (r227)
  | 514 -> One (r228)
  | 513 -> One (r229)
  | 517 | 1146 | 1216 -> One (r230)
  | 520 -> One (r231)
  | 522 -> One (r232)
  | 523 -> One (r233)
  | 528 | 532 -> One (r234)
  | 527 | 531 -> One (r235)
  | 526 | 530 -> One (r236)
  | 537 -> One (r237)
  | 539 | 1072 | 1244 -> One (r238)
  | 924 -> One (r239)
  | 923 -> One (r240)
  | 922 -> One (r241)
  | 547 -> One (r242)
  | 921 -> One (r243)
  | 920 -> One (r244)
  | 549 -> One (r245)
  | 919 -> One (r246)
  | 918 -> One (r247)
  | 555 -> One (r248)
  | 554 -> One (r249)
  | 553 -> One (r250)
  | 552 -> One (r251)
  | 656 -> One (r252)
  | 571 -> One (r253)
  | 567 -> One (r254)
  | 566 -> One (r255)
  | 565 -> One (r256)
  | 564 -> One (r257)
  | 569 -> One (r258)
  | 653 -> One (r259)
  | 647 -> One (r260)
  | 646 -> One (r261)
  | 580 | 661 -> One (r262)
  | 579 | 660 | 1409 -> One (r263)
  | 634 -> One (r264)
  | 589 -> One (r265)
  | 586 -> One (r266)
  | 588 -> One (r267)
  | 616 -> One (r268)
  | 615 -> One (r269)
  | 602 -> One (r270)
  | 599 | 612 -> One (r271)
  | 598 | 611 -> One (r272)
  | 597 | 610 -> One (r273)
  | 605 -> One (r274)
  | 604 -> One (r275)
  | 607 -> One (r276)
  | 613 -> One (r277)
  | 609 -> One (r278)
  | 633 -> One (r279)
  | 632 -> One (r280)
  | 625 -> One (r281)
  | 624 -> One (r282)
  | 623 -> One (r283)
  | 622 -> One (r284)
  | 630 -> One (r285)
  | 629 -> One (r286)
  | 644 -> One (r287)
  | 643 -> One (r288)
  | 642 -> One (r289)
  | 641 -> One (r290)
  | 651 -> One (r291)
  | 650 -> One (r292)
  | 671 -> One (r294)
  | 670 -> One (r295)
  | 669 -> One (r296)
  | 673 -> One (r298)
  | 672 -> One (r300)
  | 666 -> One (r301)
  | 665 -> One (r302)
  | 664 -> One (r303)
  | 663 -> One (r304)
  | 917 -> One (r305)
  | 678 -> One (r306)
  | 677 -> One (r307)
  | 676 -> One (r308)
  | 759 -> One (r309)
  | 755 -> One (r310)
  | 754 -> One (r311)
  | 753 -> One (r312)
  | 752 -> One (r313)
  | 748 -> One (r314)
  | 747 -> One (r315)
  | 746 -> One (r316)
  | 743 -> One (r317)
  | 742 -> One (r318)
  | 683 -> One (r319)
  | 687 -> One (r320)
  | 686 -> One (r321)
  | 685 -> One (r322)
  | 689 -> One (r323)
  | 691 -> One (r324)
  | 741 -> One (r325)
  | 740 -> One (r326)
  | 700 -> One (r327)
  | 698 -> One (r328)
  | 697 -> One (r329)
  | 732 -> One (r330)
  | 723 -> One (r331)
  | 722 -> One (r332)
  | 721 -> One (r333)
  | 713 -> One (r334)
  | 709 -> One (r335)
  | 708 -> One (r336)
  | 707 -> One (r337)
  | 706 -> One (r338)
  | 711 -> One (r339)
  | 720 -> One (r340)
  | 719 -> One (r341)
  | 718 -> One (r342)
  | 731 -> One (r343)
  | 730 -> One (r344)
  | 729 -> One (r345)
  | 745 -> One (r346)
  | 751 -> One (r347)
  | 750 -> One (r348)
  | 758 -> One (r349)
  | 764 -> One (r350)
  | 763 -> One (r351)
  | 762 -> One (r352)
  | 772 -> One (r353)
  | 771 -> One (r354)
  | 770 -> One (r355)
  | 776 -> One (r356)
  | 775 -> One (r357)
  | 774 -> One (r358)
  | 779 -> One (r359)
  | 778 -> One (r360)
  | 788 -> One (r361)
  | 787 -> One (r362)
  | 784 -> One (r363)
  | 783 -> One (r364)
  | 782 -> One (r365)
  | 781 -> One (r366)
  | 794 -> One (r367)
  | 793 -> One (r368)
  | 790 -> One (r370)
  | 907 -> One (r371)
  | 869 -> One (r372)
  | 853 -> One (r373)
  | 868 -> One (r375)
  | 867 -> One (r376)
  | 804 -> One (r377)
  | 803 -> One (r378)
  | 802 -> One (r379)
  | 801 -> One (r380)
  | 800 -> One (r381)
  | 812 -> One (r382)
  | 811 -> One (r383)
  | 810 -> One (r385)
  | 809 -> One (r386)
  | 808 -> One (r387)
  | 807 -> One (r388)
  | 828 -> One (r389)
  | 827 -> One (r390)
  | 826 -> One (r391)
  | 825 -> One (r393)
  | 824 -> One (r394)
  | 818 -> One (r395)
  | 817 -> One (r396)
  | 816 -> One (r397)
  | 815 -> One (r398)
  | 823 -> One (r399)
  | 822 -> One (r400)
  | 821 -> One (r401)
  | 820 -> One (r402)
  | 841 -> One (r403)
  | 840 -> One (r404)
  | 836 -> One (r405)
  | 835 -> One (r406)
  | 834 -> One (r407)
  | 839 -> One (r408)
  | 838 -> One (r409)
  | 855 -> One (r410)
  | 854 -> One (r411)
  | 851 -> One (r412)
  | 847 -> One (r413)
  | 846 -> One (r414)
  | 850 -> One (r415)
  | 849 -> One (r416)
  | 860 -> One (r417)
  | 859 -> One (r418)
  | 858 -> One (r419)
  | 862 -> One (r421)
  | 861 -> One (r422)
  | 864 -> One (r423)
  | 901 -> One (r424)
  | 906 -> One (r426)
  | 905 -> One (r427)
  | 876 -> One (r428)
  | 875 -> One (r429)
  | 874 -> One (r430)
  | 904 -> One (r431)
  | 881 -> One (r432)
  | 880 -> One (r433)
  | 879 -> One (r434)
  | 878 -> One (r435)
  | 903 -> One (r436)
  | 884 -> One (r437)
  | 883 -> One (r438)
  | 902 -> One (r439)
  | 888 -> One (r440)
  | 900 -> One (r441)
  | 892 -> One (r442)
  | 912 -> One (r443)
  | 915 -> One (r444)
  | 928 -> One (r445)
  | 927 -> One (r446)
  | 926 -> One (r447)
  | 940 -> One (r448)
  | 939 -> One (r449)
  | 942 | 1085 -> One (r450)
  | 1118 -> One (r451)
  | 949 -> One (r452)
  | 955 -> One (r453)
  | 1083 | 1110 -> One (r454)
  | 959 | 1097 -> One (r455)
  | 958 | 1096 -> One (r456)
  | 1036 -> One (r457)
  | 1035 -> One (r458)
  | 1034 -> One (r459)
  | 965 -> One (r460)
  | 970 -> One (r461)
  | 969 -> One (r462)
  | 1023 -> One (r463)
  | 972 -> One (r464)
  | 977 -> One (r465)
  | 979 -> One (r466)
  | 984 -> One (r467)
  | 986 -> One (r468)
  | 988 -> One (r469)
  | 990 -> One (r470)
  | 992 -> One (r471)
  | 994 -> One (r472)
  | 996 -> One (r473)
  | 998 -> One (r474)
  | 1000 -> One (r475)
  | 1002 -> One (r476)
  | 1004 -> One (r477)
  | 1006 -> One (r478)
  | 1008 -> One (r479)
  | 1010 -> One (r480)
  | 1012 -> One (r481)
  | 1014 -> One (r482)
  | 1016 -> One (r483)
  | 1018 -> One (r484)
  | 1020 -> One (r485)
  | 1022 -> One (r486)
  | 1025 -> One (r487)
  | 1027 -> One (r488)
  | 1033 -> One (r489)
  | 1032 -> One (r490)
  | 1040 -> One (r491)
  | 1039 -> One (r492)
  | 1046 -> One (r493)
  | 1045 -> One (r494)
  | 1051 -> One (r495)
  | 1050 -> One (r496)
  | 1059 -> One (r497)
  | 1058 -> One (r498)
  | 1057 -> One (r499)
  | 1056 -> One (r500)
  | 1063 -> One (r501)
  | 1062 -> One (r502)
  | 1071 -> One (r503)
  | 1075 -> One (r504)
  | 1079 | 1102 -> One (r505)
  | 1078 | 1101 -> One (r506)
  | 1082 | 1107 -> One (r507)
  | 1081 | 1106 -> One (r508)
  | 1089 -> One (r509)
  | 1091 -> One (r510)
  | 1093 -> One (r511)
  | 1120 -> One (r512)
  | 1122 -> One (r513)
  | 1125 -> One (r514)
  | 1133 -> One (r515)
  | 1132 -> One (r516)
  | 1131 -> One (r517)
  | 1130 -> One (r518)
  | 1129 -> One (r519)
  | 1137 -> One (r520)
  | 1136 -> One (r521)
  | 1135 -> One (r522)
  | 1144 -> One (r523)
  | 1143 -> One (r524)
  | 1142 -> One (r525)
  | 1141 -> One (r526)
  | 1140 -> One (r527)
  | 1152 -> One (r528)
  | 1149 -> One (r529)
  | 1151 -> One (r530)
  | 1155 -> One (r531)
  | 1158 -> One (r532)
  | 1157 -> One (r533)
  | 1172 -> One (r534)
  | 1181 -> One (r535)
  | 1187 -> One (r536)
  | 1186 -> One (r537)
  | 1203 -> One (r538)
  | 1202 -> One (r539)
  | 1201 -> One (r540)
  | 1194 -> One (r541)
  | 1196 -> One (r542)
  | 1200 -> One (r543)
  | 1199 -> One (r544)
  | 1198 -> One (r545)
  | 1205 -> One (r546)
  | 1210 -> One (r547)
  | 1209 -> One (r548)
  | 1208 -> One (r549)
  | 1207 -> One (r550)
  | 1234 -> One (r551)
  | 1219 -> One (r552)
  | 1221 -> One (r553)
  | 1220 -> One (r554)
  | 1223 -> One (r555)
  | 1225 -> One (r556)
  | 1230 -> One (r557)
  | 1229 -> One (r558)
  | 1233 -> One (r559)
  | 1243 -> One (r560)
  | 1242 -> One (r561)
  | 1241 -> One (r562)
  | 1240 -> One (r563)
  | 1248 -> One (r564)
  | 1247 -> One (r565)
  | 1257 -> One (r566)
  | 1260 -> One (r567)
  | 1263 -> One (r568)
  | 1268 -> One (r569)
  | 1270 -> One (r570)
  | 1273 -> One (r571)
  | 1280 -> One (r572)
  | 1279 -> One (r573)
  | 1278 -> One (r574)
  | 1284 -> One (r575)
  | 1296 -> One (r576)
  | 1295 -> One (r577)
  | 1298 -> One (r578)
  | 1323 -> One (r580)
  | 1322 -> One (r581)
  | 1303 -> One (r582)
  | 1302 -> One (r583)
  | 1301 -> One (r584)
  | 1308 -> One (r585)
  | 1307 -> One (r586)
  | 1321 -> One (r588)
  | 1310 -> One (r589)
  | 1320 -> One (r590)
  | 1319 -> One (r591)
  | 1318 -> One (r592)
  | 1317 -> One (r593)
  | 1316 -> One (r594)
  | 1315 -> One (r595)
  | 1314 -> One (r596)
  | 1326 -> One (r597)
  | 1325 -> One (r598)
  | 1347 -> One (r599)
  | 1345 -> One (r601)
  | 1362 -> One (r603)
  | 1361 -> One (r604)
  | 1358 -> One (r605)
  | 1328 -> One (r606)
  | 1331 -> One (r607)
  | 1330 -> One (r608)
  | 1354 -> One (r609)
  | 1353 -> One (r610)
  | 1352 -> One (r611)
  | 1336 -> One (r612)
  | 1335 -> One (r613)
  | 1334 -> One (r614)
  | 1340 -> One (r615)
  | 1339 -> One (r616)
  | 1338 -> One (r617)
  | 1348 -> One (r619)
  | 1343 -> One (r620)
  | 1342 -> One (r621)
  | 1351 -> One (r623)
  | 1357 -> One (r624)
  | 1360 -> One (r625)
  | 1365 -> One (r626)
  | 1364 -> One (r627)
  | 1367 -> One (r628)
  | 1373 -> One (r629)
  | 1372 -> One (r630)
  | 1382 -> One (r631)
  | 1405 -> One (r632)
  | 1402 -> One (r633)
  | 1426 -> One (r634)
  | 1424 -> One (r636)
  | 1414 -> One (r637)
  | 1413 -> One (r638)
  | 1412 -> One (r639)
  | 1411 -> One (r640)
  | 1423 -> One (r641)
  | 1422 -> One (r642)
  | 1419 -> One (r643)
  | 1428 -> One (r644)
  | 1435 -> One (r645)
  | 1437 -> One (r646)
  | 1442 -> One (r647)
  | 1441 -> One (r648)
  | 1440 -> One (r649)
  | 1446 -> One (r650)
  | 1445 -> One (r651)
  | 1444 -> One (r652)
  | 1450 -> One (r653)
  | 1449 -> One (r654)
  | 1448 -> One (r655)
  | 1454 -> One (r656)
  | 1453 -> One (r657)
  | 1452 -> One (r658)
  | 1460 -> One (r659)
  | 1459 -> One (r660)
  | 1458 -> One (r661)
  | 1457 -> One (r662)
  | 1456 -> One (r663)
  | 1464 -> One (r664)
  | 1463 -> One (r665)
  | 1462 -> One (r666)
  | 1468 -> One (r667)
  | 1467 -> One (r668)
  | 1466 -> One (r669)
  | 1484 -> One (r670)
  | 1472 -> One (r671)
  | 1471 -> One (r672)
  | 1478 -> One (r673)
  | 1477 -> One (r674)
  | 1480 -> One (r675)
  | 1488 | 1536 -> One (r676)
  | 1487 | 1535 -> One (r677)
  | 1486 | 1534 -> One (r678)
  | 1485 | 1533 -> One (r679)
  | 1492 | 1540 -> One (r680)
  | 1491 | 1539 -> One (r681)
  | 1490 | 1538 -> One (r682)
  | 1489 | 1537 -> One (r683)
  | 1495 -> One (r684)
  | 1494 -> One (r685)
  | 1502 -> One (r686)
  | 1501 -> One (r687)
  | 1500 -> One (r688)
  | 1499 -> One (r689)
  | 1498 -> One (r690)
  | 1497 -> One (r691)
  | 1510 -> One (r692)
  | 1509 -> One (r693)
  | 1504 -> One (r695)
  | 1508 -> One (r696)
  | 1527 -> One (r697)
  | 1513 -> One (r698)
  | 1518 -> One (r699)
  | 1517 -> One (r700)
  | 1526 -> One (r702)
  | 1525 -> One (r703)
  | 1516 -> One (r704)
  | 1515 -> One (r705)
  | 1522 -> One (r706)
  | 1521 -> One (r707)
  | 1520 -> One (r708)
  | 1524 -> One (r709)
  | 1541 -> One (r710)
  | 1544 -> One (r711)
  | 1548 -> One (r712)
  | 1547 -> One (r713)
  | 1550 -> One (r714)
  | 1554 -> One (r715)
  | 1558 -> One (r716)
  | 960 -> Select (function
    | -1 -> [R 90]
    | _ -> r238)
  | 455 -> Select (function
    | -1 -> [R 710]
    | _ -> [R 238])
  | 335 -> Select (function
    | 459 | 965 | 1037 | 1207 | 1334 | 1487 | 1491 | 1535 | 1539 -> [R 562]
    | _ -> S (N N_pattern) :: r99)
  | 330 -> Select (function
    | 459 | 965 | 1037 | 1207 | 1334 | 1487 | 1491 | 1535 | 1539 -> [R 563]
    | _ -> S (N N_pattern) :: r98)
  | 163 -> Select (function
    | 889 -> [R 696]
    | _ -> r50)
  | 446 -> Select (function
    | -1 -> S (T T_RPAREN) :: r24
    | _ -> r23)
  | 482 -> Select (function
    | -1 -> S (T T_RBRACKET) :: r92
    | _ -> S (N N_expr_semi_list) :: r193)
  | 1418 -> Select (function
    | 1415 -> r296
    | _ -> S (T T_EQUAL) :: r643)
  | 112 -> Select (function
    | 459 | 965 | 1037 | 1207 | 1334 | 1487 | 1491 | 1535 | 1539 -> S (N N_pattern) :: r22
    | _ -> r23)
  | _ -> raise Not_found
