package sgame;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.util.HashMap;
//import opengl31.vbo.VBO;
import org.lwjgl.BufferUtils;
import org.lwjgl.opengl.GL11;
import org.lwjgl.opengl.GL20;
import org.lwjgl.opengl.GL30;
import org.lwjgl.util.vector.Matrix;
import org.lwjgl.util.vector.Matrix2f;
import org.lwjgl.util.vector.Matrix3f;
import org.lwjgl.util.vector.Matrix4f;

/**
 * This is a Shader wrapper that helps in the setup of a shader object called a
 * Program. On instantiation the Program object is created towhich can be added
 * vertex and fragment shaders with the addShader(String filename) method. After
 * adding shaders code to the program it needs to be linked with the
 * linkProgram() method. When the shader Program needs to be used then execute
 * the bind() method. To turn the shader off execute the unbind() method.
 * Uniform variables can be can be defined and added to the shader with the
 * defineUniform(String name) and set with the overloaded setUniform methods.
 *
 * @author Paul
 */
public class Program {

    public static Program current = null;

    public static HashMap SHADERS = new HashMap();
    public HashMap attributes = new HashMap();

    public FloatBuffer buffer = BufferUtils.createFloatBuffer(16);

    private int program = -1;
    private String vertexShaderName = null;
    private int vertexShaderIndex = -1;
    private String fragmentShaderName = null;
    private int fragmentShaderIndex = -1;
    private int geometricShader = -1;

    private int attributeIndex = -1;

    private HashMap uniforms = new HashMap();

    /**
     * On constructing the Shader object create a new shader Program.
     */
    public Program() {
        program = GL20.glCreateProgram();
    }

    /**
     * This adds and compiles the shader program contain in the file to the
     * current shader.
     *
     * @param filename Relative file path of the shader program.
     *
     */
    public void addShader(String filename, boolean isfrag) {
        ByteBuffer bb = null;
        int shader = 0;
        if (SHADERS.containsKey(filename)) {
            shader = (int) SHADERS.get(filename);
            GL20.glAttachShader(program, shader);
            return;
        } else {
            try {
                URL url = this.getClass().getResource(filename);
                if (url == null) {
                    throw new Exception("url is null");
                }

                String[] groups = filename.split("\\.");

                String type = groups[groups.length - 1];

                URLConnection connection = (URLConnection) url.openConnection();

                InputStream is = connection.getInputStream();

                bb = ByteBuffer.allocateDirect(connection.getContentLength());
                byte[] b = new byte[connection.getContentLength()];
                is.read(b);
                bb.put(b);
                bb.flip();

                if (!isfrag) {
                    if (compileVertexShader(bb)) {
                        GL20.glAttachShader(program, vertexShaderIndex);
                        SHADERS.put(filename, vertexShaderIndex);
                    } else {
                        System.out.println("******** start vertex info log*********");
                        printInformationLog(vertexShaderIndex);
                        System.out.println("********end vertex info log*********");
                    }
                } else {
                    if (compileFragmentShader(bb)) {
                        GL20.glAttachShader(program, fragmentShaderIndex);
                        SHADERS.put(filename, fragmentShaderIndex);
                    } else {
                        System.out.println("******** start fragment info log*********");
                        printInformationLog(fragmentShaderIndex);
                        System.out.println("********end fragment info log*********");
                    }
                }

            } catch (Exception ex) {
                System.out.println("the following file does not exist " + filename);
            }
        }

    }

    /**
     * Create Vertex shader and compile the code contained in ByteBuffer b.
     * Attached the compiled shader to the program.
     */
    public boolean compileVertexShader(ByteBuffer b) {
        vertexShaderIndex = GL20.glCreateShader(GL20.GL_VERTEX_SHADER);
        GL20.glShaderSource(vertexShaderIndex, b);
        GL20.glCompileShader(vertexShaderIndex);

        return (GL20.glGetShader(vertexShaderIndex, GL20.GL_COMPILE_STATUS) == GL11.GL_TRUE);
    }

    /**
     * Create Fragment shader and compile the code contained in ByteBuffer b.
     * Attached the compiled shader to the program.
     */
    public boolean compileFragmentShader(ByteBuffer b) {
        fragmentShaderIndex = GL20.glCreateShader(GL20.GL_FRAGMENT_SHADER);
        GL20.glShaderSource(fragmentShaderIndex, b);
        GL20.glCompileShader(fragmentShaderIndex);
        return (GL20.glGetShader(fragmentShaderIndex, GL20.GL_COMPILE_STATUS) == GL11.GL_TRUE);
    }

    /**
     * Link the Vertex and Fragment shaders A printout to the console lists any
     * errors with the linkage.
     */
    public void printInformationLog(int shader) {
        IntBuffer length = BufferUtils.createIntBuffer(1);
        GL20.glGetShader(shader, GL20.GL_INFO_LOG_LENGTH, length);
        ByteBuffer log = BufferUtils.createByteBuffer(length.get(0));
        GL20.glGetShaderInfoLog(shader, length, log);
        for (int i = 0; i < log.capacity(); i++) {
            System.out.print((char) log.get(i));
        }
    }

    public void linkProgram() {

        System.out.println(getVersion());

        GL20.glLinkProgram(program);

        IntBuffer ib = BufferUtils.createIntBuffer(1000);

        ib.position(0);

        GL20.glGetProgram(program, GL20.GL_LINK_STATUS, ib);

        System.out.println("program link status " + ib.get(0));

        if (ib.get(0) == 0) {
            System.out.println("Link unsuccessful!");
        }
    }

    /**
     * Make the current shader program current. The method name "bind" is used
     * to use similar terminology to other OpenGL objects.
     */
    public void bind() {
        GL20.glUseProgram(program);
        Program.current = this;

    }

    /**
     * Disable the shader program.
     *
     */
    public void unbind() {
        GL20.glUseProgram(0);
        Program.current = null;
    }

    /**
     * Define the uniform variable name to be used in the shader.
     *
     * @param name
     */
    public void defineUniform(String name) {
        uniforms.put(name, GL20.glGetUniformLocation(program, name));
    }

    public void setUniform(String name, int count, FloatBuffer buffer) {
        int oldLimit = buffer.limit();
        buffer.limit(buffer.position() + count);
        GL20.glUniform1((int) uniforms.get(name), buffer);
        buffer.limit(oldLimit);
    }

    public void setUniform(String name, int count, IntBuffer buffer) {
        int oldLimit = buffer.limit();
        buffer.limit(buffer.position() + count);
        GL20.glUniform1((int) uniforms.get(name), buffer);
        buffer.limit(oldLimit);
    }

    /**
     * Set the integer value associated with the uniform variable name.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, int i) {
        GL20.glUniform1i((int) uniforms.get(name), i);
    }

    /**
     * Set the float value associated with the uniform variable name.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, float i) {
        GL20.glUniform1f((int) uniforms.get(name), i);
    }

    /**
     * Set the int values associated with the uniform variable name. This is
     * used to set a shader variable of type vec2.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, int a, int b) {
        GL20.glUniform2i((int) uniforms.get(name), a, b);
    }

    /**
     * Set the float values associated with the uniform variable name. This is
     * used to set a shader variable of type vec2.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, float a, float b) {
        GL20.glUniform2f((int) uniforms.get(name), a, b);
    }

    /**
     * Set the int values associated with the uniform variable name. This is
     * used to set a shader variable of type vec3.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, int a, int b, int c) {
        GL20.glUniform3i((int) uniforms.get(name), a, b, c);
    }

    /**
     * Set the float values associated with the uniform variable name. This is
     * used to set a shader variable of type vec3.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, float a, float b, float c) {
        GL20.glUniform3f((int) uniforms.get(name), a, b, c);
    }

    /**
     * Set the int values associated with the uniform variable name. This is
     * used to set a shader variable of type vec4.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, int a, int b, int c, int d) {
        GL20.glUniform4i((int) uniforms.get(name), a, b, c, d);
    }

    /**
     * Set the float values associated with the uniform variable name. This is
     * used to set a shader variable of type vec4.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, float a, float b, float c, float d) {
        GL20.glUniform4f((int) uniforms.get(name), a, b, c, d);
    }

    /**
     * Set the float values associated with the uniform variable name. This is
     * used to set a shader variable of type mat4.
     *
     * @param name of the uniform variable.
     * @param The value to set the uniform variable.
     */
    public void setUniform(String name, boolean transpose, Matrix4f matrix) {

        buffer.position(0);
        buffer.limit(16);
        matrix.store(buffer);
        buffer.position(0);

        GL20.glUniformMatrix4((int) uniforms.get(name), transpose, buffer);

    }

    public void setUniform(String name, boolean transpose, Matrix3f matrix) {

        buffer.position(0);
        buffer.limit(9);
        matrix.store(buffer);
        buffer.position(0);

        GL20.glUniformMatrix3((int) uniforms.get(name), transpose, buffer);

    }

    public void setUniform(String name, boolean transpose, Matrix2f matrix) {

        buffer.position(0);
        buffer.limit(4);
        matrix.store(buffer);
        buffer.position(0);

        GL20.glUniformMatrix4((int) uniforms.get(name), transpose, buffer);

    }

    public void setUniform(String name, boolean transpose, FloatBuffer buffer) {

        buffer.position(0);

        switch (buffer.capacity()) {
            case (4):
                GL20.glUniformMatrix2((int) uniforms.get(name), transpose, buffer);
                break;
            case (9):
                GL20.glUniformMatrix3((int) uniforms.get(name), transpose, buffer);
                break;
            case (16):
                GL20.glUniformMatrix4((int) uniforms.get(name), transpose, buffer);
                break;
        }
    }

    public void defineFragOut(int index, String variableName) {
        GL30.glBindFragDataLocation(program, index, variableName);
    }

    /**
     * Create an attribute index to be associated with a in variable name of a
     * shader program. The attribute index is used to bind attribute data within
     * a Buffer Object.
     *
     * @param shaderAttribute
     * @param attributeName
     */
    public void bindAttribute(String attributeName) {
        attributeIndex++;
        attributes.put(attributeName, attributeIndex);
        GL20.glBindAttribLocation(program, attributeIndex, attributeName);
    }

    /**
     * Return the index associated with an attribute name
     *
     * @param attributeName
     * @return
     */
    public int getAttributeIndex(String attributeName) {
        return (int) attributes.get(attributeName);
    }

    public boolean containsAttribute(String attributeName) {
        return attributes.containsKey(attributeName);
    }

    /**
     * Detach the shader from the program and delete it.
     */
    public void delete() {
        IntBuffer shaderCount = BufferUtils.createIntBuffer(16);

        GL20.glGetProgram(program, GL20.GL_ATTACHED_SHADERS, shaderCount);

        System.out.println("delete " + shaderCount.get(0) + " shaders");

        IntBuffer shaders = BufferUtils.createIntBuffer(shaderCount.get(0));

        GL20.glGetAttachedShaders(program, shaderCount, shaders);

        for (int i = 0; i < shaderCount.get(0); i++) {
            GL20.glDetachShader(program, shaders.get(i));
            GL20.glDeleteShader(shaders.get(i));
        }

        GL20.glUseProgram(0);
        GL20.glDeleteProgram(program);

    }

    /**
     * Get the index associated with this program.
     *
     * @return
     */
    public int getProgram() {
        return program;
    }

    /**
     * Returns the shader version.
     *
     * @return
     */
    public static String getVersion() {
        return "shader language version : " + GL11.glGetString(GL20.GL_SHADING_LANGUAGE_VERSION);
    }

    public static int getAttributeCapacity() {
        return GL11.glGetInteger(GL20.GL_MAX_VERTEX_ATTRIBS);
    }
}
