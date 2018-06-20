# frozen_string_literal: true

require_relative 'views/mixins/document_view_mixin'
require_relative 'views/mixins/mutable_document_view_mixin'

require_relative 'views/view_context_for_compilation'
require_relative 'views/view_context_for_pre_compilation'
require_relative 'views/view_context_for_shell'

require_relative 'views/view'

require_relative 'views/basic_item_rep_view'
require_relative 'views/basic_item_rep_collection_view'
require_relative 'views/basic_item_view'

require_relative 'views/compilation_item_rep_view'
require_relative 'views/compilation_item_rep_collection_view'
require_relative 'views/compilation_item_view'

require_relative 'views/config_view'
require_relative 'views/identifiable_collection_view'
require_relative 'views/item_collection_with_reps_view'
require_relative 'views/item_collection_without_reps_view'
require_relative 'views/layout_view'
require_relative 'views/layout_collection_view'

require_relative 'views/mutable_config_view'
require_relative 'views/mutable_identifiable_collection_view'
require_relative 'views/mutable_item_view'
require_relative 'views/mutable_item_collection_view'
require_relative 'views/mutable_layout_view'
require_relative 'views/mutable_layout_collection_view'

require_relative 'views/post_compile_item_view'
require_relative 'views/post_compile_item_collection_view'
require_relative 'views/post_compile_item_rep_view'
require_relative 'views/post_compile_item_rep_collection_view'
