# name: discourse-sort-by-topic-title
# about: A simple plugin to allow sorting topics by title
# version: 0.2
# authors: piBie
# url: https://github.com/pi-bie/discourse-sort-by-topic-title

enabled_site_setting :sort_by_topic_title_enabled

after_initialize do
	if SiteSetting.sort_by_topic_title_enabled

		require_dependency 'topic_query'
		class ::TopicQuery
			SORTABLE_MAPPING["title"] = "title"

			module SortByTitleCreateList
				def create_list(filter, options = {}, topics = nil)
					topics ||= default_results(options)
					topics = yield(topics) if block_given?
					
					alloptions = options.merge(@options)
					if alloptions[:order] == 'title'
						topics = prioritize_pinned_topics(topics, alloptions)
					end
					super(filter, options, topics)
				end
			end
			prepend SortByTitleCreateList
		end
	
	end
end
