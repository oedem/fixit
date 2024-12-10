CREATE TABLE IF NOT EXISTS logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    log_type ENUM('login', 'logout', 'action', 'register', 'update_profile', 'change_password', 'add_logs') NOT NULL,
    log_message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    INDEX idx_user_id (user_id),
    INDEX idx_log_type (log_type),
    INDEX idx_created_at (created_at)
);

CREATE TABLE IF NOT EXISTS error_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    error_code INT NOT NULL,
    error_message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_error_code (error_code),
    INDEX idx_created_at (created_at)
);

CREATE TABLE IF NOT EXISTS access_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    access_type ENUM('read', 'write', 'delete') NOT NULL,
    accessed_table VARCHAR(255) NOT NULL,
    accessed_column VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    INDEX idx_user_id (user_id),
    INDEX idx_access_type (access_type),
    INDEX idx_accessed_table (accessed_table),
    INDEX idx_created_at (created_at)
);

CREATE TABLE IF NOT EXISTS add_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    log_id INT NOT NULL,
    user_id INT NOT NULL,
    log_message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (log_id) REFERENCES logs(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    INDEX idx_log_id (log_id),
    INDEX idx_user_id (user_id),
    INDEX idx_created_at (created_at)
);