class Message < ApplicationRecord

    def self.get_message id
        sql_query = ['SELECT * FROM messages WHERE id = ?', id ]

        result = connection.exec_query(sanitize_sql_array sql_query).first
    end

    def self.save_message params
        sql_query = ['INSERT INTO messages (user_id, content, created_at, updated_at) VALUES (?,?,?,?)',
            params[:user_id],
            params[:content],
            Time.now,
            Time.now
        ]

        user = connection.insert(sanitize_sql_array sql_query)
    end

    def self.update_message params
        sql_query = ['UPDATE messages SET content = ?, updated_at = ? WHERE user_id = ?',
            params[:content],
            Time.now,
            params[:user_id]
        ]

        user = connection.update(sanitize_sql_array sql_query)
    end

    def self.delete params
        sql_query = ['DELETE FROM messages WHERE id = ? and user_id = ?',
            params[:message_id],
            params[:user_id]
        ]

        connection.exec_query(sanitize_sql_array sql_query)
    end

    def self.validate_delete params
        sql_query = ['SELECT * FROM messages WHERE id = ? and user_id = ?',
            params[:message_id],
            params[:user_id]
        ]

        result = connection.exec_query(sanitize_sql_array sql_query)
    end 
end
