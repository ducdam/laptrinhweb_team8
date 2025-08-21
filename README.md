Sau khi bạn đã sửa file HTML/JSP trong thư mục webapp, để website hiển thị thay đổi mới, bạn cần deploy lại ứng dụng. Các bước như sau:

1.Build lại project: Mở terminal tại thư mục chứa pom.xml và chạy:

mvn clean package

Lệnh này sẽ tạo lại file WAR mới trong thư mục target.

2.Copy file WAR mới lên Tomcat:

brew services stop tomcat

Xóa file WAR cũ và thư mục giải nén cũ trong webapps (nếu có):

rm /opt/homebrew/Cellar/tomcat/<version>/libexec/webapps/team8shop-1.0-SNAPSHOT.war
rm -rf /opt/homebrew/Cellar/tomcat/<version>/libexec/webapps/team8shop-1.0-SNAPSHOT

Copy file WAR mới vào:

cp target/team8shop-1.0-SNAPSHOT.war /opt/homebrew/Cellar/tomcat/<version>/libexec/webapps/

(Thay <version> bằng phiên bản Tomcat bạn đang dùng, ví dụ 10.1.24.)

3.Khởi động lại Tomcat:

brew services start tomcat

4.Truy cập lại website:
Vào trình duyệt, truy cập lại địa chỉ cũ (ví dụ: http://localhost:8080/team8shop-1.0-SNAPSHOT/about.jsp) để xem thay đổi.

Lưu ý:

Nếu không thấy thay đổi, hãy thử xóa cache trình duyệt hoặc nhấn Ctrl + F5 để tải lại trang.
Nếu sửa file trong thư mục target, thay đổi sẽ bị ghi đè khi build lại. Hãy luôn sửa trong webapp.
