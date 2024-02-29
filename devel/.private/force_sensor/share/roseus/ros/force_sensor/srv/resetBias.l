;; Auto-generated. Do not edit!


(when (boundp 'force_sensor::resetBias)
  (if (not (find-package "FORCE_SENSOR"))
    (make-package "FORCE_SENSOR"))
  (shadow 'resetBias (find-package "FORCE_SENSOR")))
(unless (find-package "FORCE_SENSOR::RESETBIAS")
  (make-package "FORCE_SENSOR::RESETBIAS"))
(unless (find-package "FORCE_SENSOR::RESETBIASREQUEST")
  (make-package "FORCE_SENSOR::RESETBIASREQUEST"))
(unless (find-package "FORCE_SENSOR::RESETBIASRESPONSE")
  (make-package "FORCE_SENSOR::RESETBIASRESPONSE"))

(in-package "ROS")





(defclass force_sensor::resetBiasRequest
  :super ros::object
  :slots (_reset_bias_request ))

(defmethod force_sensor::resetBiasRequest
  (:init
   (&key
    ((:reset_bias_request __reset_bias_request) nil)
    )
   (send-super :init)
   (setq _reset_bias_request __reset_bias_request)
   self)
  (:reset_bias_request
   (&optional (__reset_bias_request :null))
   (if (not (eq __reset_bias_request :null)) (setq _reset_bias_request __reset_bias_request)) _reset_bias_request)
  (:serialization-length
   ()
   (+
    ;; bool _reset_bias_request
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reset_bias_request
       (if _reset_bias_request (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reset_bias_request
     (setq _reset_bias_request (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass force_sensor::resetBiasResponse
  :super ros::object
  :slots (_reset_bias_response ))

(defmethod force_sensor::resetBiasResponse
  (:init
   (&key
    ((:reset_bias_response __reset_bias_response) nil)
    )
   (send-super :init)
   (setq _reset_bias_response __reset_bias_response)
   self)
  (:reset_bias_response
   (&optional (__reset_bias_response :null))
   (if (not (eq __reset_bias_response :null)) (setq _reset_bias_response __reset_bias_response)) _reset_bias_response)
  (:serialization-length
   ()
   (+
    ;; bool _reset_bias_response
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reset_bias_response
       (if _reset_bias_response (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reset_bias_response
     (setq _reset_bias_response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass force_sensor::resetBias
  :super ros::object
  :slots ())

(setf (get force_sensor::resetBias :md5sum-) "746b7f4e281851ca839750a1bcfc846b")
(setf (get force_sensor::resetBias :datatype-) "force_sensor/resetBias")
(setf (get force_sensor::resetBias :request) force_sensor::resetBiasRequest)
(setf (get force_sensor::resetBias :response) force_sensor::resetBiasResponse)

(defmethod force_sensor::resetBiasRequest
  (:response () (instance force_sensor::resetBiasResponse :init)))

(setf (get force_sensor::resetBiasRequest :md5sum-) "746b7f4e281851ca839750a1bcfc846b")
(setf (get force_sensor::resetBiasRequest :datatype-) "force_sensor/resetBiasRequest")
(setf (get force_sensor::resetBiasRequest :definition-)
      "bool reset_bias_request
---
bool reset_bias_response
")

(setf (get force_sensor::resetBiasResponse :md5sum-) "746b7f4e281851ca839750a1bcfc846b")
(setf (get force_sensor::resetBiasResponse :datatype-) "force_sensor/resetBiasResponse")
(setf (get force_sensor::resetBiasResponse :definition-)
      "bool reset_bias_request
---
bool reset_bias_response
")



(provide :force_sensor/resetBias "746b7f4e281851ca839750a1bcfc846b")


