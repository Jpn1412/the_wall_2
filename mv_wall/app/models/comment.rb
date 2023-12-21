class Comment < ApplicationRecord

    def self.get_comment id
        sql_query = ['SELECT * FROM comments WHERE id = ?', id ]

        result = connection.exec_query(sanitize_sql_array sql_query).first
    end

    def self.save_comment params
        sql_query = ['INSERT INTO comments (user_id, message_id, content, created_at, updated_at) VALUES (?,?,?,?,?)',
            params[:user_id],
            params[:message_id],
            params[:content],
            Time.now,
            Time.now
        ]

        comment = connection.insert(sanitize_sql_array sql_query)
    end

    def self.update_comment params
        sql_query = ['UPDATE comments SET content = ?, updated_at = ? WHERE user_id = ?',
            params[:content],
            Time.now,
            params[:user_id]
        ]

        user = connection.update(sanitize_sql_array sql_query)
    end

    def self.delete params
        sql_query = ['DELETE FROM comments WHERE id = ? and user_id = ?',
            params[:comment_id],
            params[:user_id]
        ]

        connection.exec_query(sanitize_sql_array sql_query)
    end

    def self.validate_delete params
        sql_query = ['SELECT * FROM comments WHERE id = ? and user_id = ?',
            params[:comment_id],
            params[:user_id]
        ]

        result = connection.exec_query(sanitize_sql_array sql_query)
    end 
end
