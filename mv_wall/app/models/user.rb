require 'bcrypt'
class User < ApplicationRecord

    def self.fetch_user email
        sql_query = ['SELECT * FROM users WHERE email = ?', email]
        result = connection.exec_query(sanitize_sql_array sql_query).first
    end

    def self.save_user params
        sql_query = ['INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES (?,?,?,?,?,?)',
            params[:first_name],
            params[:last_name],
            params[:email],
            encrypt_password(params[:password]),
            Time.now,
            Time.now
        ]

        user = connection.insert(sanitize_sql_array sql_query)
    end

    def self.validate_registration params
        validations = []
        validations << 'Fill up all blanks' if params.values.any? { |value| value.nil? || value.empty? }
        validations << 'Invalid email format' unless params[:email] =~ /\A[^@\s]+@[^@\s]+\z/
        validations << "Password doesn't match" if params[:password] != params[:confirm_password]
        validations << 'Password should be at least 8 characters long' if params[:password].length < 8
        validations.compact
    end

    def self.encrypt_password password
        encrypted_password = BCrypt::Password.create(password)
    end

    def self.authenticate_password password, entered_password
        BCrypt::Password.new(password) == entered_password
    end
end
