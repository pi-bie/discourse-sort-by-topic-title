# name: discourse-sort-by-topic-title
# about: A simple plugin to allow sorting topics by title
# version: 0.1
# authors: piBie
# url: https://github.com/pi-bie/discourse-sort-by-topic-title

enabled_site_setting :sort_by_topic_title_enabled

after_initialize do
	if SiteSetting.sort_by_topic_title_enabled

		require_dependency 'topic_query'
		class ::TopicQuery
			SORTABLE_MAPPING["title"] = "title"

		end
	
	end
end
